## Architecture Recommendation:
For a fast-growing food delivery startup handling GPS logs, text, transactions, and images, I recommend a **Data Lakehouse architecture**.

_A Lakehouse combines the cost-effective, flexible storage of a Data Lake with the performance and ACID compliance of a Data Warehouse._ 

Here are three specific reasons for this choice:

**Support for Multimodal Data:** 
The startup handles a mix of structured `(payment transactions), semi-structured (GPS logs/JSON)`, and unstructured data _(restaurant menu images and text reviews)_. A Lakehouse allows you to store all these formats in a single location _(like S3 or Azure Blob Storage)_ while still providing a structured metadata layer for querying.

**Schema Evolution and ACID Transactions:** Food delivery data is high-velocity. As the startup grows, the schema for GPS logs or menu structures will likely change. A Lakehouse `(using frameworks like Delta Lake or Apache Iceberg) `ensures data integrity during concurrent writes and allows for seamless schema evolution without the rigid constraints of a traditional Data Warehouse.

**Unified Analytics and Machine Learning:**
 By using a Lakehouse, your data scientists can run ML models directly on the raw images and text reviews `(unstructured data)` for sentiment analysis or OCR, while your business analysts can simultaneously run high-performance SQL queries on transaction data for financial reporting. This eliminates the need for complex, expensive ETL processes between a separate Lake and Warehouse.