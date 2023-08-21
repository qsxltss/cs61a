.read data.sql


CREATE TABLE bluedog AS
  SELECT color,pet from students where color='blue' and pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color,pet,song from students where color='blue' and pet = 'dog';


CREATE TABLE matchmaker AS
  Select a.pet, a.song, a.color, b.color from students as a, students as b where a.pet = b.pet and a.song = b.song and a.time < b.time; 

CREATE TABLE sevens AS
  select a.seven from students as a, numbers as b where a.number =7 and b.'7' = "True" and a.time = b.time; 

CREATE TABLE favpets AS
  select pet, count(*) as num from students Group by pet ORDER BY num DESC Limit 10;

CREATE TABLE dog AS
  select pet,num from favpets where pet = "dog";

CREATE TABLE bluedog_agg AS
  select song,count(*) as num from bluedog_songs GROUP BY song order by num DESC;


CREATE TABLE instructor_obedience AS
  select seven,instructor,count(*) from students where seven = '7' GROUP BY instructor;
