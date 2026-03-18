//2.2 — MongoDB Operations:
// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    "product_id": "EL-1",
    "name": "Quantum X1 Pro Laptop",
    "category": "Electronics",
    "Brand" : "Dell",
    "price": 85000,
    "specs": {
      "warranty_months": 24,
      "voltage": "110V-240V",
      "ram": "16GB",
      "storage": ["512GB SSD", "1TB HDD"]
    },
    "stock": 15
  },
  {
    "product_id": "CL-2",
    "name": "Organic Cotton Slim Fit Shirt",
    "category": "Clothing",
    "price": 1800,
    "attributes": {
      "size": ["M", "L", "XL"],
      "color": "Navy Blue",
      "material": "100% Cotton"
    },
    "care_instructions": "Machine wash cold"
  },
  {
    "product_id": "GR-303",
    "name": "Premium Greek Yogurt",
    "category": "Groceries",
    "price": 120,
    "expiry_date": "2024-11-15T00:00:00Z",
    "nutritional_info": {
      "calories": 150,
      "protein_g": 12,
      "fat_g": 5
    },
    "is_perishable": true
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({ 
    "category": "Electronics", 
    "price": { $gt: 20000 } 
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({ 
    "category": "Groceries", 
    "expiry_date": { $lt: ISODate("2025-01-01T00:00:00Z") } 
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
    { "product_id": "ELEC-101" },
    { $set: { "discount_percent": 10 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ "category": 1 });

/* EXPLANATION: In a product catalog, filtering by 'category' is the most common read operation. 
Without an index, MongoDB must perform a collection scan (checking every document). 
An index allows for a targeted B-tree search, significantly reducing latency as the catalog grows.
*/

