-- ==========================================
-- Generate sample orders
-- ==========================================

INSERT INTO orders(user_id,total_amount,status)

SELECT

(SELECT user_id FROM users ORDER BY random() LIMIT 1),

round((random()*100 + 20)::numeric,2),

'PAID'

FROM generate_series(1,20);