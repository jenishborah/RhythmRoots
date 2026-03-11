-- ==========================================
-- Insert users dataset from CSV
-- ==========================================

COPY users(name,email,password_hash)
FROM '/docker-entrypoint-initdb.d/users.csv'
DELIMITER ','
CSV HEADER;