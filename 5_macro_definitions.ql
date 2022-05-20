import cpp

/*
Question 0.2: ntohl, ntohll, and ntohs can either be functions or macros (depending on the platform where the code is compiled).
As these snapshots for U-Boot were built on Linux, we know they are going to be macros. Write a query to find the definition of these macros.
*/

from Macro m
where m.getName().regexpMatch("ntoh(ll|l|s)")
select m

