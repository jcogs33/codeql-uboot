import cpp

/*
Question 1.2: Find the expressions that resulted in these macro invocations.

Hint: We need to get the expression of the macro invocation we found in 1.1
*/

from MacroInvocation mi
where mi.getMacro().getName().regexpMatch("ntoh(ll|l|s)")
select mi.getExpr()
