# API Documentation
This API provides CRUD (Create, Read, Update, Delete) operations for the Product and Category tables in a PostgreSQL database. It allows you to manage products and categories.
## Product Table

        | Column     | Type     | Description              |
        |------------|----------|--------------------------|
        | id         | integer  | Unique ID for the product |
        | name       | text     | Name of the product       |
        | description| text     | Description of the product|
        | price      | numeric  | Price of the product      |
        | quantity   | integer  | Quantity available        |
        | imageURL   | text     | URL of the product image  |


        # Category Table

        | Column     | Type     | Description                 |
        |------------|----------|-----------------------------|
        | id         | integer  | Unique ID for the category  |
        | name       | text     | Name of the category        |
        | imageURL   | text     | URL of the category image   |

# Product Endpoints
# API Documentation

This API provides CRUD (Create, Read, Update, Delete) operations for the Product and Category tables in a PostgreSQL database. It allows you to manage products and categories, perform reviews, and more.

## Product Endpoints

### Get all products

- Endpoint: GET /products
- Description: Retrieves all products from the database with support for sorting, filtering, and pagination.
- Parameters:
  - `sort` (optional): Specifies the sorting column and direction. Default is 'id:asc'. E.g., `sort=name:asc` for sorting by name in ascending order.
  - `filter` (optional): Specifies the filter conditions. E.g., `filter=category:electronics` for filtering products by category.
  - `page` (optional): Specifies the page number for pagination. Default is 1.
  - `limit` (optional): Specifies the maximum number of products per page. Default is 10.
- Sample Response:
  ```json
  {
    "data": [
      {
        "id": 1,
        "name": "Product 1",
        "description": "Description of Product 1",
        "price": 19.99,
        "quantity": 100,
        "imageURL": "https://example.com/product1.jpg"
      },
      {
        "id": 2,
        "name": "Product 2",
        "description": "Description of Product 2",
        "price": 29.99,
        "quantity": 50,
        "imageURL": "https://example.com/product2.jpg"
      }
    ],
    "pagination": {
      "page": 1,
      "limit": 10,
      "total": 2
    }
  }

## Get a product by ID
* Endpoint: GET /products/{id}
- Description: Retrieves a product by its ID.
- Sample Response:
   ```json
    {
    "id": 1,
    "name": "Product 1",
    "description": "Description of Product 1",
    "price": 19.99,
    "quantity": 100,
    "imageURL": "https://example.com/product1.jpg"
    }
## Create a new product
* Endpoint: POST /products
- Description: Creates a new product.
- Request Body:
  ```json
    {
    "name": "New Product",
    "description": "Description of New Product",
    "price": 24.99,
    "quantity": 50,
    "imageURL": "https://example.com/newproduct.jpg"
    }

- Sample Response:
  ```json
    {
    "id": 3,
    "name": "New Product",
    "description": "Description of New Product",
    "price": 24.99,
    "quantity": 50,
    "imageURL": "https://example.com/newproduct.jpg"
    }

## Update a product
* Endpoint: PUT /products/{id}
- Description: Updates an existing product.
- Request Body:
  ```json
    {
    "name": "Updated Product",
    "description": "Updated description",
    "price": 29.99,
    "quantity": 75,
    "imageURL": "https://example.com/updatedproduct.jpg"
    }
- Sample Response:
  ```json
    {
    "id": 1,
    "name": "Updated Product",
    "description": "Updated description",
    "price": 29.99,
    "quantity": 75,
    "imageURL": "https://example.com/updatedproduct.jpg"
    }
## Delete a product
* Endpoint: DELETE /products/{id}
- Description: Deletes a product by its ID.
- Sample Response:
  ```json
    {
    "message": "Product deleted successfully."
    }
# Category Endpoints

## Get all categories

- Endpoint: `GET /categories`
- Description: Retrieves all categories from the database with support for sorting, filtering, and pagination.
- Parameters:
  - `sort` (optional): Specifies the sorting column and direction. Default is 'id:asc'. E.g., `sort=name:asc` for sorting by name in ascending order.
  - `filter` (optional): Specifies the filter conditions. E.g., `filter=name:electronics` for filtering categories by name.
  - `page` (optional): Specifies the page number for pagination. Default is 1.
  - `limit` (optional): Specifies the maximum number of categories per page. Default is 10.
- Sample Response:
  ```json
  {
    "data": [
      {
        "id": 1,
        "name": "Category 1",
        "imageURL": "https://example.com/category1.jpg"
      },
      {
        "id": 2,
        "name": "Category 2",
        "imageURL": "https://example.com/category2.jpg"
      }
    ],
    "pagination": {
      "page": 1,
      "limit": 10,
      "total": 2
    }
  }

## Get a category by ID
* Endpoint: GET /categories/{id}
- Description: Retrieves a category from the database by its ID.
- Sample Response:
  ```json
    {
    "id": 1,
    "name": "Category 1",
    "imageURL": "https://example.com/category1.jpg"
    }
## Create a new category
* Endpoint: POST /categories
- Description: Creates a new category in the database.
- Request Body:
  ```json
    {
    "name": "New Category",
    "imageURL": "https://example.com/newcategory.jpg"
    }
- Sample Response:
  ```json
    {
    "id": 3,
    "name": "New Category",
    "imageURL": "https://example.com/newcategory.jpg"
    }
## Update a category
* Endpoint: PUT /categories/{id}
- Description: Updates an existing category in the database.
- Request Body:
  ```json
    {
    "name": "Updated Category",
    "imageURL": "https://example.com/updatedcategory.jpg"
    }
- Sample Response:
  ```json
    {
    "id": 1,
    "name": "Updated Category",
    "imageURL": "https://example.com/updatedcategory.jpg"
    }
## Delete a category
* Endpoint: DELETE /categories/{id}
- Description: Deletes a category from the database by its ID.
- Sample Response:
  ```json
    {
    "message": "Category deleted successfully."
    }