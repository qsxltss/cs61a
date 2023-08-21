CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT a.name,b.size from dogs as a, sizes as b where a.height > b.min and a.height <= b.max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT a.name from dogs as a, parents as b, dogs as c where b.child = a.name and b.parent = c.name ORDER BY c.height DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT a.name || " and " || b.name ||" are "|| a.size|| " siblings"
  from size_of_dogs as a, size_of_dogs as b, parents as c, parents as d 
  where a.name < b.name and a.size = b.size and c.child = a.name and d.child = b.name
  and c.parent = d.parent;


-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper1(dogs, stack_height, last_height);
CREATE TABLE stacks_helper2(dogs, stack_height, last_height);
CREATE TABLE stacks_helper3(dogs, stack_height, last_height);
CREATE TABLE stacks_helper4(dogs, stack_height, last_height);
-- Add your INSERT INTOs here
INSERT INTO stacks_helper1 select name,height,height from dogs;
INSERT INTO stacks_helper2 select a.dogs||", "||b.name as dogs, a.stack_height+b.height as stack_height, b.height as last_height 
from stacks_helper1 as a,dogs as b where b.height>a.last_height;
INSERT INTO stacks_helper3 select a.dogs||", "||b.name as dogs, a.stack_height+b.height as stack_height, b.height as last_height 
from stacks_helper2 as a,dogs as b where b.height>a.last_height;
INSERT INTO stacks_helper4 select a.dogs||", "||b.name as dogs, a.stack_height+b.height as stack_height, b.height as last_height 
from stacks_helper3 as a,dogs as b where b.height>a.last_height;


CREATE TABLE stacks AS
  SELECT dogs,stack_height from stacks_helper4 where stack_height>=170 ORDER BY stack_height;

