## Subjective
## Vector DB Use Case

For a law firm managing 500-page contracts, a traditional keyword-based database search would likely not suffice. Keyword searches rely on exact string matching or BM25 ranking, which flags documents containing specific words like `termination`However, legal language is often dense and nuanced; a lawyer might ask about termination`ending the agreement,` but the contract may only use the term `dissolution` or `period of notice`.
_- A keyword search would miss these semantically related sections because the literal characters do not match.__

A vector database solves this by shifting from **"keyword matching"** to **"semantic searching"**. In this system, the 500-page contracts are broken into smaller chunks and converted into high-dimensional vectors (embeddings) that represent their underlying meaning. When a lawyer asks, __"What are the termination clauses?"__, the system converts that question into a vector and finds the _"nearest neighbors"_ in the ector space.

The role of the vector database is to efficiently store these mathematical representations and perform high-speed similarity searches. It allows the system to understand that `termination` and `ceasing operations` are conceptually close, regardless of the specific vocabulary used. This enables a **Retrieval-Augmented Generation (RAG)** workflow where the most relevant legal snippets are retrieved and presented to the lawyer, significantly reducing the time spent manually proofreading hundreds of pages for specific legal obligations.