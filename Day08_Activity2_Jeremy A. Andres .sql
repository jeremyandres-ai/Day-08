Row count:
SELECT COUNT(*)
FROM new_employment;
does it match the file ? Yes Eyeball:
SELECT
FROM new_hires
LIMIT;
SELECT *
FROM new_employment
WHERE hire_date > '2023-01-01'
LIMIT 5 columns aligned,
    values sane ? YES Sanity :SELECT MIN(salary),
    MAX(salary)
FROM new_employment;
SELECT first_name,
    last_name,
    salary
FROM new_employment
WHERE salary = (
        SELECT MIN(salary)
        FROM new_employment
    )
    OR salary = (
        SELECT MAX(salary)
        FROM new_employment
    );
plausible pay range ? Yes