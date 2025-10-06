# RSVP Movies – IMDb SQL Case Study

SQL-first analysis on the IMDb schema to surface data-driven insights for RSVP Movies’ 2022 global release strategy, using table exploration, joins, ranking, and window functions over movies, ratings, genres, names, roles, and production companies.

## Introduction

RSVP Movies plans to launch a film for a global audience and wants to ground key decisions in data.  
Using the IMDb schema, this project explores recent multi-year movie data to extract patterns in **genres, ratings, votes, production houses, actors/actresses, and directors** that inform content, casting, and partnerships.

## Business Understanding

In a competitive global market, greenlighting decisions hinge on **genre demand**, **runtime expectations**, **creator/actor performance**, and **brand pull** of production houses.  
This analysis consolidates IMDb tables to guide:
- Which **genres** and **durations** resonate
- Which **directors/actors** consistently drive high ratings
- Which **production houses** attract large audiences (votes)

## Business Objectives

Identify drivers that support:
- Genre and runtime **positioning** for a global release
- **Talent selection** (directors/actors/actresses) with strong performance signals
- **Partnership** choices with production houses that amplify reach

## Analytical Approach

1. **Schema & Data Understanding**  
   Review tables, row counts, null profiles; study ERD relationships (movies–genres–ratings–names–role/director mapping).  
   *(See ERD workbook.)*

2. **Exploration & EDA (SQL)**  
   - Year/month output trends, country splits  
   - Genre coverage & average durations  
   - Ratings/votes distributions and rank lists  
   - Talent and production-company leaderboards

3. **KPI Queries & Window Functions**  
   - Genre ranks, moving averages, running totals  
   - Weighted averages (votes) for talent ranking  
   - Multilingual hits, month and year slices

4. **Synthesis → Executive Insights**  
   Consolidate findings into an **executive summary** for decision makers.

## Tools & Libraries

- **SQL** (MySQL-compatible syntax)  
- Window functions (RANK/DENSE_RANK/ROW_NUMBER), CTEs, conditional aggregation

## Key Insights

- **Output & Seasonality:** A downward trend in overall movie counts across years; **March** shows the highest monthly releases (824). :contentReference[oaicite:0]{index=0}  
- **Genres:** **Drama** has the largest total output (~4,285 titles), with ~1,078 released in 2019; **Action** and **Thriller** are also top-volume genres. Average runtimes: **Action ~113 min**, **Drama ~107**, **Thriller ~102**. :contentReference[oaicite:1]{index=1} :contentReference[oaicite:2]{index=2}  
- **Directors & Talent:** In the top 3 genres with avg rating >8, standout directors include **James Mangold, Soubin Shahir, Joe Russo**; top Indian-market actors by median ratings include **Mammootty, Mohanlal**. :contentReference[oaicite:3]{index=3} :contentReference[oaicite:4]{index=4}  
- **Production Power:** By total votes, **Marvel Studios, Twentieth Century Fox, Warner Bros** lead; by average-rating “hits,” **Dream Warrior Pictures** and **National Theatre Live** top the list. :contentReference[oaicite:5]{index=5} :contentReference[oaicite:6]{index=6}  
- **Casting Shortlist (India focus):** For regional authenticity with proven audience pull, consider **Vijay Sethupathi, Fahadh Faasil, Yogi Babu, Joju George, Ammy Virk**; actresses **Taapsee Pannu, Kriti Sanon, Divya Dutta, Shraddha Kapoor, Kriti Kharbanda**. :contentReference[oaicite:7]{index=7}

> Full query logic and result tables are reproducible via the SQL script. :contentReference[oaicite:8]{index=8}

## Conclusion & Business Impact

The SQL EDA highlights **genre focus (Drama/Action/Thriller)**, **runtime expectations (~102–113 min)**, and a **shortlist of proven directors/actors/production partners** to de-risk greenlighting and maximize global reach.  
These findings can seed content strategy, casting outreach, and co-production discussions for RSVP’s next project. :contentReference[oaicite:9]{index=9}

## Files in this Repository

| File Name                               | Description |
|-----------------------------------------|-------------|
| `IMDB+question_Solved.sql`              | End-to-end SQL solutions (Q1–Q29): EDA, rankings, window functions, multilingual hits, leaderboards. :contentReference[oaicite:10]{index=10} |
| `IMDb+movies+Data+and+ERD+final.xlsx`   | Tables (sample slices) & ERD to understand relationships and joins. |
| `Executive Summary of RSVP Movies Case Study.pdf` | Slide-style consolidation of insights for stakeholders. :contentReference[oaicite:11]{index=11} |

---

## Author

**Aakash Maskara**  
*M.S. Robotics & Autonomy, Drexel University*  
Data Science | Machine Learning | Quantitative Finance

[LinkedIn](https://linkedin.com/in/aakashmaskara) • [GitHub](https://github.com/AakashMaskara)
