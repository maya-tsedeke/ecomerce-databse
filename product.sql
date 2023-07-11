-- Function to get all products with sorting, filtering, and pagination
CREATE OR REPLACE FUNCTION get_all_products(
    _sort_column TEXT DEFAULT 'id',
    _sort_direction TEXT DEFAULT 'ASC',
    _filter_column TEXT DEFAULT NULL,
    _filter_value TEXT DEFAULT NULL,
    _limit INTEGER DEFAULT NULL,
    _offset INTEGER DEFAULT 0
)
RETURNS TABLE (
    id INTEGER,
    name TEXT,
    description TEXT,
    price NUMERIC,
    quantity INTEGER,
    imageURL TEXT
)
AS $$
BEGIN
    RETURN QUERY EXECUTE
        FORMAT(
            'SELECT id, name, description, price, quantity, imageURL
             FROM Product
             WHERE (%1$s IS NULL OR %1$s = %2$L)
             ORDER BY %3$I %4$L
             LIMIT %5$s OFFSET %6$s;',
            _filter_column, _filter_value, _sort_column, _sort_direction, _limit, _offset
        );
END;
$$ LANGUAGE plpgsql;

-- Query to get a product by ID
SELECT id, name, description, price, quantity, imageURL
FROM Product
WHERE id = <product_id>;

-- Function to update a product
CREATE OR REPLACE FUNCTION update_product(
    _product_id INTEGER,
    _name TEXT,
    _description TEXT,
    _price NUMERIC,
    _quantity INTEGER,
    _imageURL TEXT
)
RETURNS VOID
AS $$
BEGIN
    UPDATE Product
    SET name = COALESCE(_name, name),
        description = COALESCE(_description, description),
        price = COALESCE(_price, price),
        quantity = COALESCE(_quantity, quantity),
        imageURL = COALESCE(_imageURL, imageURL)
    WHERE id = _product_id;
END;
$$ LANGUAGE plpgsql;

-- Function to delete a product
CREATE OR REPLACE FUNCTION delete_product(_product_id INTEGER)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM Product
    WHERE id = _product_id;
END;
$$ LANGUAGE plpgsql;

-- Function to get all categories with sorting, filtering, and pagination
CREATE OR REPLACE FUNCTION get_all_categories(
    _sort_column TEXT DEFAULT 'id',
    _sort_direction TEXT DEFAULT 'ASC',
    _filter_column TEXT DEFAULT NULL,
    _filter_value TEXT DEFAULT NULL,
    _limit INTEGER DEFAULT NULL,
    _offset INTEGER DEFAULT 0
)
RETURNS TABLE (
    id INTEGER,
    name TEXT,
    imageURL TEXT
)
AS $$
BEGIN
    RETURN QUERY EXECUTE
        FORMAT(
            'SELECT id, name, imageURL
             FROM Category
             WHERE (%1$s IS NULL OR %1$s = %2$L)
             ORDER BY %3$I %4$L
             LIMIT %5$s OFFSET %6$s;',
            _filter_column, _filter_value, _sort_column, _sort_direction, _limit, _offset
        );
END;
$$ LANGUAGE plpgsql;

-- Query to get a category by ID
SELECT id, name, imageURL
FROM Category
WHERE id = <category_id>;

-- Function to update a category
CREATE OR REPLACE FUNCTION update_category(
    _category_id INTEGER,
    _name TEXT,
    _imageURL TEXT
)
RETURNS VOID
AS $$
BEGIN
    UPDATE Category
    SET name = COALESCE(_name, name),
        imageURL = COALESCE(_imageURL, imageURL)
    WHERE id = _category_id;
END;
$$ LANGUAGE plpgsql;

-- Function to delete a category
CREATE OR REPLACE FUNCTION delete_category(_category_id INTEGER)
RETURNS VOID
AS $$
BEGIN
    DELETE FROM Category
    WHERE id = _category_id;
END;
$$ LANGUAGE plpgsql;
