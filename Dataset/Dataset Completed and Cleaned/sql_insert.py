import csv

def sanitize(value):
    """Function to sanitize SQL data"""
    return value.replace("'", "''")

sql_queries = []

# Predefined mapping of age certifications to AC codes
ratings_dictionary = {
    "PG": "AC1",
    "PG-13": "AC10",
    "R": "AC11",
    "G": "AC2",
    "TV-G": "AC3",
    "TV-Y7": "AC4",
    "TV-PG": "AC5",
    "TV-Y7-FV": "AC6",
    "TV-MA": "AC7",
    "TV-14": "AC8",
    "TV-Y": "AC9"
}

# Sets to hold unique genres
genres_set = set()
used_age_certifications = set()

with open('titles.csv', 'r', encoding='utf-8-sig') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        # Apply constraints
        if not row['age_certification'] or row['genres'] == '[]' or not row['imdb_score'] or not row['imdb_votes']:
            continue

        # Get the correct AC code from the ratings dictionary
        age_cert = row['age_certification']
        age_code = ratings_dictionary.get(age_cert)
        
        # If the age certification code is not found in the dictionary, we skip the row
        if not age_code:
            continue

        # Insert into AgeCertifications if it hasn't been used already
        if age_cert not in used_age_certifications:
            used_age_certifications.add(age_cert)
            sql_queries.append("INSERT INTO AgeCertifications (Age_Certification_Code, Age_Certification_Name) VALUES ('{}', '{}');".format(age_code, sanitize(age_cert)))

        # Insert into Title
        seasons_val = 'NULL' if row['seasons'] == '' else row['seasons']
        sql_queries.append("INSERT INTO Title (title_id, title, show_type, description, release_year, runtime, Age_Certification_Code, seasons, IMDB_Score, IMDB_Votes) VALUES ('{}', '{}', '{}', '{}', {}, {}, '{}', {}, {}, {});".format(sanitize(row['id']), sanitize(row['title']), sanitize(row['type']), sanitize(row['description']), row['release_year'], row['runtime'], age_code, seasons_val, row['imdb_score'], row['imdb_votes']))

        genres = eval(row['genres'])
        for genre in genres:
            if genre not in genres_set:
                genres_set.add(genre)
                sql_queries.append("INSERT INTO Genre (Genre_Name) VALUES ('{}');".format(sanitize(genre)))

        # Process Title_Genre with a SELECT subquery to get the Genre_ID
        for genre in genres:
            title_genre_insert = (
                "INSERT INTO Title_Genre (title_id, Genre_ID) "
                "SELECT '{}', Genre_ID FROM Genre WHERE Genre_Name = '{}';"
            ).format(sanitize(row['id']), sanitize(genre))
            sql_queries.append(title_genre_insert)

# Outputting SQL queries
for query in sql_queries:
    print(query)



# import csv

# def sanitize(value):
#     """Function to sanitize SQL data"""
#     return value.replace("'", "''")

# sql_queries = []

# with open('credits.csv', 'r', encoding='utf-8-sig') as csvfile:
#     reader = csv.DictReader(csvfile)
#     for row in reader:
#         # Prepare character_name value based on role
#         character_name = "NULL" if row['role'] == 'DIRECTOR' else "'{}'".format(sanitize(row['character']))

#         # Query to insert data into Credit table with the condition
#         sql_queries.append("INSERT INTO Credit (name, character_name, role, title_id) SELECT '{}', {}, '{}', '{}' WHERE EXISTS (SELECT 1 FROM Title WHERE title_id = '{}');".format(sanitize(row['name']), character_name, sanitize(row['role']), row['id'], row['id']))

# # Outputting SQL queries
# print("\n".join(sql_queries))
