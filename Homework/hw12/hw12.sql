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

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size from dogs, sizes where min < height and height <= max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_height AS
  SELECT child from parents, dogs where parent = name order by -height;;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  with
    siblings(first, second) as (
      select a.child, b.child from parents as a, parents as b 
        where a.parent = b.parent and a.child > b.child 
    )
  select second || ' and ' || first || ' are ' || a.size || ' siblings' 
    from siblings, size_of_dogs as a, size_of_dogs as b 
    where a.size = b.size and a.name = first and b.name = second;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks AS
   with 
    stack_recur(dogs, total, n, max) as (
      select name, height, 1, height from dogs union
      select dogs || ', ' || name, total+height, n+1, height 
        from stack_recur, dogs
        where n < 4 and max < height
    )
    select dogs, total from stack_recur 
      where total >= 170 and n = 4 order by total;
