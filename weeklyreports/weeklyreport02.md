Weekly Report (2013-6-24 - 2013-6-30)
=====================================

What I have done:
-----------------
In this week we analyzed the branch profiles which were collected last week.
The optimization opportunities we have found are promising.
We observed plenty of branches which could not be proved dead were rarely executed
can be filtered out to speed up the JITed codes.

Another result we have observed is that a hot loop would overwirte previous branch information very quickly,
no matter how large buffer size we allocated. In fact the buffer size we can afford is small:
a buffer contains 256 pointers would cost 2K on 64-bit machines (1k on 32-bit machines) for each JSScript,
which would exceed our budget of memory. After disscussing with my mentor,
we decided to implement the block counter solution first.

Deliverables:
-------------
[Benefit Analysis Report](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis.md)


What I am planning to do next week:
-----------------------------------
Implement the Branch Profiler using block counters.
