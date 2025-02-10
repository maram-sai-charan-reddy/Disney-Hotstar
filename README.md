# 🎬 Disney+ Subscriber Analysis  
🚀 *Leveraging Data Analytics to Improve Disney+ Subscriber Growth & Engagement*  

![Disney+ Analysis](https://img.shields.io/badge/Data%20Analysis-SQL%20%7C%20Python%20%7C%20PowerBI-blue)  
![Status](https://img.shields.io/badge/Status-Completed-success)  

---

## 📖 Overview  
Disney+ competes in the **highly competitive streaming industry** alongside Netflix, Amazon Prime, and HBO Max.  
This project **analyzes subscriber behavior, content performance, and regional demand** to help Disney+ **increase engagement and reduce churn** through data-driven insights.  

---

## 🎯 Problem Statement  
Disney+ faces several key challenges:  
✅ **Subscriber Retention** – Why do users stay or leave?  
✅ **Content Engagement** – What content keeps users subscribed?  
✅ **Market Gaps** – Which genres/regions should Disney+ prioritize?  
✅ **Pricing Strategy** – How does pricing impact subscriber growth?  

By analyzing **Disney+ streaming data**, this project provides valuable recommendations to **enhance user experience, optimize content strategy, and improve subscriptions.**  

---

## 📊 Datasets & Technologies  

### 📂 Datasets Used  
📌 **IMDb Data** – Ratings, genres, and content metadata  
📌 **JustWatch Data** – Regional availability & subscription pricing  
📌 **SQL Query Results** – Streaming patterns & user engagement metrics  

### 🛠 Tech Stack  
🔹 **Languages:** Python (Pandas, BeautifulSoup, SQLAlchemy)  
🔹 **Databases:** PostgreSQL, MySQL  
🔹 **APIs & Web Scraping:** IMDb API, JustWatch API, BeautifulSoup  
🔹 **Data Visualization:** Power BI, Matplotlib, Seaborn  
🔹 **Workflow Automation:** SQL, Python Scripts, Excel Macros  

---

## 🏗 Project Workflow  

### **1️⃣ Data Collection**  
📌 Scraped **IMDb & JustWatch** data using BeautifulSoup & APIs.  
📌 Collected metadata (ratings, genres, pricing) and stored in a structured database.  

### **2️⃣ Data Cleaning & Transformation**  
📌 Processed missing values, normalized text fields, and structured data in **PostgreSQL**.  
📌 Optimized database performance using **indexing & normalization** (15% query speed boost).  

### **3️⃣ Content Performance Analysis**  
📌 Identified top-performing **genres, regional demand, and user engagement trends**.  
📌 Analyzed the correlation between **IMDb ratings & user retention rates**.  

### **4️⃣ Subscriber Insights & Trends**  
📌 Conducted **A/B testing on marketing campaigns** to refine ad targeting strategies.  
📌 Developed a **pricing sensitivity model** to assess the impact of subscription fees on retention.  

### **5️⃣ Automation & Reporting**  
📌 Automated data ingestion workflows using **SQLAlchemy & Python scripts**.  
📌 Created **interactive dashboards in Power BI** for real-time KPI tracking.  

---

## 🔥 Key Findings & Recommendations  

✅ **High Engagement Genres:** Action, Adventure, and Family content drive most viewer interactions.  
✅ **Regional Preferences:**  
- **U.S.** → Marvel, Star Wars, and Disney Originals dominate viewership.  
- **Europe** → High interest in historical dramas and localized content.  

✅ **Subscriber Churn Insights:**  
- High churn in regions **without localized content offerings**.  
- Users prefer **flexible pricing models** over rigid subscription plans.  

### **📌 Actionable Recommendations for Disney+:**  
✔ Invest in **localized content production** to attract regional audiences.  
✔ Focus on acquiring **IMDb-rated 7.5+ content** to increase engagement & retention.  
✔ Introduce **tiered pricing models** for better affordability & lower churn rates.  

---

## 🚀 How to Run the Project  

### 📥 1. Clone the Repository  
```bash
git clone https://github.com/your-username/disney-subscriber-analysis.git
cd disney-subscriber-analysis

📦 2. Set Up Database
Use PostgreSQL/MySQL
Run create.sql to create the database schema
Run insert.sql and insert2.sql to populate the database

🔍 3. Run Queries for Analysis
psql -U your_user -d disney_db -f queries.sql

📅 Future Enhancements

📌 Expand dataset to analyze competitor streaming services.
📌 Use Machine Learning models to predict churn rates.
📌 Integrate real-time analytics dashboards for dynamic decision-making.
