CREATE TABLE intern (
    intern_id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    school TEXT,
    start_date TEXT
);
INSERT INTO intern (intern_id, full_name, school, start_date)
VALUES (1, 'Paula Vergara', 'PUP', '2024-06-10'),
    (2, 'Rico Dizon', 'UST', '2024-06-10'),
    (3, 'Sam Aguilar', NULL, '2024-06-10');
SELECT COUNT (*) AS total_rows
FROM intern;
Answer: 3
SELECT *
FROM intern
WHERE school IS NOT NULL;
Answer: Paula Vergara,
Rico Dizon