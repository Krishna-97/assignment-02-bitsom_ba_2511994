## 6.2 Design Justification:

## Storage Systems
For this capstone, the storage strategy is partitioned to meet four specific goals: `Persistence, Scalability, Analytical Performance, and AI Readiness`. I chose **PostgreSQL or Mysql as the primary OLTP (Online Transactional Processing) engine**. Its ACID compliance ensures data integrity for core business entities, which is critical when handling historical records or financial data where "lost" rows are unacceptable. For the **Analytical Goal**, data is migrated to a columnar format (such as `Parquet files` or a `dedicated OLAP warehouse`). Columnar storage is chosen because it significantly reduces I/O for the types of "Group By" and "Aggregation" queries common in Tableau reporting.

For the **AI and Generative AI goals**, I utilized a **Vector Database** (such as `'ChromaDB' or 'Pinecone'`) alongside a standard `Blob Storage (like AWS S3)` for model artifacts. The Vector DB is essential for storing embeddings, enabling the AI model to perform efficient semantic searches that standard relational databases cannot handle effectively.

## OLTP vs OLAP Boundary:
The boundary in this design is established at the `ETL (Extract, Transform, Load) `junction. The OLTP system ends at the production database, which is optimized for row-level inserts and updates. The Analytical system begins once the data is cleaned, denormalized, and moved into the reporting schema.In this architecture, I have implemented a _"Medallion Architecture"_ approach. The `Bronze layer` (raw data) still sits near the OLTP side `silver Layer`, while the `Gold layer` (highly aggregated, feature-engineered tables) represents the start of the OLAP boundary. This separation ensures that complex AI training jobs or heavy Tableau refreshes do not latency-spike the transactional system used for day-to-day data entry.

## Trade-offs :

A significant trade-off in this design is `Consistency vs. Latency (Eventual Consistency)`. By separating the OLTP and OLAP layers, the reporting layer is not "real-time"; there is a delay (the ETL lag) between a data update and its appearance in the AI model's context or the Tableau dashboard.

