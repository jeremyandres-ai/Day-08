Part A — The NULL Hunt Who has NO department assigned yet ? (Show first_name, last_name.Remember: IS NULL.)
SELECT first_name,
    last_name
From new_employment
WHERE department = '';
Whose salary is still missing ? (One person — who ?)
SELECT first_name,
    last_name
FROM new_employment
WHERE salary = '';
Who ? GIO Panganiban 15.Run the three counts
and explain the differences in one sentence: COUNT(*),
COUNT(salary),
COUNT(department).
SELECT COUNT (*) AS total_rows,
    COUNT (salary) AS salary_count,
    COUNT(department) AS department_count
FROM new_employment;
16.The trap,
on purpose: run
WHERE department = NULL.How many rows ? Why ? (One sentence.)
SELECT *
FROM new_employment
WHERE department IS NULL;
It returns 0 rows because NULL cannot be compared
from using =.Use IS NULL instead.17.Run
SELECT first_name,
    salary
FROM new_hires
ORDER BY salary ASC;
— who appears FIRST,
and what does that tell you about how SQLite sorts NULL ?
SELECT first_name,
    salary
FROM new_employment
ORDER BY salary ASC;
The first person will be the one with the NULL salary,
because the SQLite sorts NULL
values first in ascendingvorder.Part B — HR 's First-Week Questions (Day 7 skills on imported data)

18. Which new hires are based in Manila or Makati?
 (IN — show first_name, city.) How many?

SELECT first_name, city 
FROM new_employment
WHERE city IN (' Manila ', ' Makati ');

SELECT COUNT (*)
FROM new_employment
WHERE city IN (' Manila ', ' Makati ');

How many? 20


19. How many were hired in 2024? (LIKE on hire_date.)

SELECT COUNT (*)
FROM new_employment
WHERE hire_date LIKE ' 2024 %';

24

20. Who earns between ₱25,000 and ₱30,000?
 (BETWEEN — show first_name, salary.)

SELECT first_name, salary 
FROM new_employment 
WHERE salary BETWEEN ' 25000 ' AND ' 30000 ';

21. Top 3 paid new hires? (ORDER BY + LIMIT.)

SELECT DISTINCT first_name, salary
FROM new_employment
WHERE first_name != ' first_name '
ORDER BY CAST(salary AS INT) DESC
LIMIT 3;
ANSWER : MIKO,CARLO, KIKO

22. What cities do the new hires live in — no repeats? (DISTINCT.)
 Compare with the old employees table: which city is NEW to the company?

 SELECT DISTINCT city 
 FROM new_employment;

 SELECT DISTINCT city 
 FROM new_employment
 WHERE city NOT IN (SELECT city 
 FROM employees);

23. HR asks: “One list please — every new hire with ANY missing information
 (department or salary), sowe can chase the paperwork.” Write ONE query.
  (Hint: two IS NULLs and an OR.)

  SELECT *
  FROM new_employment
  WHERE department = ''
  OR salary = '';