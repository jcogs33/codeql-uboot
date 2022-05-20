import cpp

/*
Question 0.1: Modify the query to find the definition of memcpy.
*/

from Function f
where f.getName() = "memcpy"
select f
