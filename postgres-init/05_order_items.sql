INSERT INTO order_items(order_id, product_id, quantity, price_at_purchase)

SELECT
    o.id,
    a.album_id,
    (random()*2 + 1)::int,
    a.price
FROM orders o
JOIN LATERAL (
    SELECT album_id, price
    FROM albums
    ORDER BY random()
    LIMIT 1
) a ON true;