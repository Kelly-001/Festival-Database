-- this query creates a view that shows the participants the concert schedule, ordered by time and date (uses an ORDER BY and multiple tables, connected by INNER JOINS)
CREATE VIEW concert_schedule
AS
SELECT a.artist_name, ps.performance_time, d.date 
FROM performance_schedule ps
INNER JOIN  artists a 
ON a.artist_id = ps.artist_id 
INNER JOIN festival_date d 
ON d.date_id = ps.date_id
ORDER BY d.date,ps.performance_time;

SELECT * FROM concert_schedule;

-- this query shows the wristband balance of each participant at the beginning and at the end of the festival (uses a subquery, IFNULL, CONCAT, LEFT JOIN)
SELECT DISTINCT p.participant_id,CONCAT(p.first_name , ' ' , p.last_name) AS participant, p.wristband_balance AS initial_balance, (p.wristband_balance - IFNULL((
						SELECT SUM(f.amount_spent)
						FROM food_purchases f
					WHERE p.participant_id = f.participant_id) -  							IFNULL((SELECT SUM(a.amount_spent)
FROM activity_purchases a
WHERE p.participant_id = a.participant_id),0),0)) AS final_balance
FROM participants p
LEFT JOIN food_purchases f 
ON p.participant_id = f.participant_id
ORDER BY p.participant_id;
  
-- this query shows the total amount spent from food and activity purchases at the festival (uses the set function SUM and a UNION ALL)
SELECT SUM(amount_spent) FROM (
    SELECT fp.amount_spent FROM food_purchases fp UNION ALL
    SELECT ap.amount_spent FROM activity_purchases ap
) AS unionresult;

-- this query shows what participants are allowed to do kayaking (uses a user-defined function that examines age)
DELIMITER //
CREATE FUNCTION agerestrictions(age INT) 
RETURNS VARCHAR(3)
READS SQL DATA DETERMINISTIC
BEGIN 
DECLARE allowed VARCHAR(3);
IF age >= 18 THEN
SET allowed = 'YES';
ELSEIF age < 18 THEN
SET allowed = 'NO';
END IF;
RETURN allowed;
END //
DELIMITER ;

SELECT p.participant_id, p.first_name, p.last_name, agerestrictions(age) AS allowed
FROM participants p;

-- this query creates a view that shows which employee welcomed which participant to the festival (uses a CONCAT and an INNER JOIN)
CREATE VIEW welcoming_participants
AS
SELECT CONCAT(p.first_name , ' ' , p.last_name) AS participant, CONCAT(e.first_name , ' ' , e.last_name) AS employee
FROM participants p
INNER JOIN employees e 
ON e.employee_id = p.employee_id;

SELECT * FROM welcoming_participants;

-- this query shows how many participants each employee in the Welcoming Participants department welcomed to the festival (uses a COUNT, a CONCAT, an INNER JOIN and a GROUP BY)
SELECT CONCAT(e.first_name , ' ' , e.last_name) AS employee, COUNT(p.employee_id)
FROM employees e
INNER JOIN participants p ON e.employee_id = p.employee_id
GROUP BY e.employee_id;

-- this query creates a view that shows where each food truck and activity employee works (uses a CONCAT and multiple tables, connected by INNER JOINS and UNION)
CREATE VIEW employee_view
AS
SELECT CONCAT(e.first_name , ' ' , e.last_name) AS employee, e.department, ft.food_truck_name AS working_for
FROM food_trucks ft
INNER JOIN employees e
ON e.employee_id = ft.employee_id
UNION
SELECT CONCAT(e.first_name , ' ' , e.last_name) AS employee, e.department, act.activity_name
FROM activities act
INNER JOIN employees e
ON e.employee_id = act.employee_id;
 
SELECT * FROM employee_view;







