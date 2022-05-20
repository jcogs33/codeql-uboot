import cpp

/*
Question 1.1: Find all the calls to ntohl, ntohll, and ntohs.

Hint: calls to ntohl, ntohll, and ntohs are macro invocations, unlike memcpy which is a function call.
*/

from MacroInvocation mi
where mi.getMacro().getName().regexpMatch("ntoh(ll|l|s)")
select mi
