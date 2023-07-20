INSERT INTO firstdatabaseo.groups (id, name, location, start_date, max_participants) VALUES
(1, 'green lanterns', 'London', '2023-01-01', 10),
(2, 'the yellow shirts', 'Paris', '2023-02-01', 15);
INSERT INTO learners (id, name, email, active) VALUES
(1, 'amalia branescu', 'amaliab1@example.com', TRUE),
(2, 'dan daianu', 'dandaianu2@example.com', TRUE);
INSERT INTO coaches (id, name) VALUES
(1, 'Stefan branescu'),
(2, 'miahela constantin');
SELECT * FROM firstdatabaseo.groups;
SELECT name AS learner_name, email FROM firstdatabaseo.learners LIMIT 1;
SELECT * FROM firstdatabaseo.groups;
UPDATE firstdatabaseo.groups 
SET 
    start_date = DATE_ADD(start_date,INTERVAL 2 MONTH)
WHERE
    id = 1;
    ALTER TABLE firstdatabaseo.groups
ADD status TEXT;
INSERT INTO firstdatabaseo.learners (id, name, email, active) VALUES
(3, "mihai popescu", 'mihai@yahoo.com', TRUE);
SELECT * FROM learners;
SELECT* FROM groups;
SELECT* FROM coaches;
INSERT INTO coaches(id,name) VALUES
(3,"andrei g");
SELECT* FROM coaches;
DELETE FROM learners 
WHERE id=3;
SELECT* FROM learners;
SELECT * FROM learners WHERE id = 3;
DELETE FROM learners
WHERE id=3;
SET sql_safe_updates =0;
DELETE FROM learners
WHERE id=3;
ALTER TABLE firstdatabaseo.groups
ADD PRIMARY KEY (id);

ALTER TABLE learners
ADD PRIMARY KEY (id);

ALTER TABLE coaches
ADD PRIMARY KEY (id);

ALTER TABLE learners
ADD COLUMN group_id INT;

ALTER TABLE learners
ADD CONSTRAINT fk_learners_group
FOREIGN KEY (group_id) REFERENCES groups(id);

ALTER TABLE firstdatabaseo.groups
ADD COLUMN coach_id INT;

ALTER TABLE groups
ADD CONSTRAINT fk_groups_coaches
FOREIGN KEY (coach_id) REFERENCES coaches(id);

ALTER TABLE groups
MODIFY COLUMN coach_id INT NOT NULL;
SELECT *FROM groups;
SELECT 
    *
FROM
    learners;
select *from groups;
update groups
set coach_id=2
where id=2;
select *from learners;
UPDATE learners
SET group_id = 1
WHERE id = 1;
UPDATE learners
SET group_id = 1
WHERE id = 2;
SELECT 
    coach_id, name, location
FROM
    groups
WHERE
    id = 1;
select coaches.id, coaches.name, groups.id, groups.name. groups.location
from groups
FULL (OUTER) JOIN coaches ON groups.coach_id=coaches.id;
SELECT coaches.id, coaches.name, groups.id, groups.name, groups.location
FROM groups
FULL OUTER JOIN coaches ON groups.coach_id = coaches.id;
SELECT coaches.id, coaches.name, groups.id, groups.name, groups.location
FROM coaches
RIGHT JOIN groups ON groups.coach_id = coaches.id;
SELECT coaches.id, coaches.name, groups.id, groups.name, groups.location
FROM groups
FULL OUTER JOIN coaches ON groups.coach_id = coaches.id;
SELECT coaches.id, coaches.name, groups.id, groups.name, groups.location
FROM groups
LEFT JOIN coaches ON groups.coach_id = coaches.id;
SELECT coaches.id, coaches.name, groups.id, groups.name, learners.name, learners.email
FROM groups
LEFT JOIN coaches ON groups.coach_id = coaches.id and
right join learners on learners.group_id=group.id;

SELECT coaches.id, coaches.name, groups.id, groups.name, learners.name, learners.email
FROM groups
LEFT JOIN coaches ON groups.coach_id = coaches.id
RIGHT JOIN learners ON learners.group_id = groups.id;
SELECT coaches.id, coaches.name, groups.id, groups.name, learners.name, learners.email
FROM groups
LEFT JOIN coaches ON groups.coach_id = coaches.id
LEFT JOIN learners ON learners.group_id = groups.id;
select* from learners;
select* from groups;
INSERT INTO learners (id, name, email, active) VALUES
(3, 'ion gogu', 'ghjhgh@example.com', TRUE),
(4, 'vasile ion', 'fbgnnh@example.com', TRUE),
(5, 'emilia grecu', 'sbgnhmb@example.com', TRUE),
(6, 'buda dan', 'egdfgf@example.com', TRUE);
select * from learners;