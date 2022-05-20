import cpp

/*
Question 1.0: Find all the calls to memcpy.

Hint: Use the auto-completion feature on the function call variable to guess how to 
express the relation between a function call and a function, and how to bind them.
*/

from FunctionCall fc
where fc.getTarget().getName() = "memcpy"
select fc
