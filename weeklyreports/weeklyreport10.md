Weekly Report (2013-8-19 - 2013-8-25)
=====================================

What I have done:
-----------------
In this week I have fixed the bugs existed in LIR Reorder Algorithms.
It turns out that the vector pushedArugments\_ in LIRGraph was
depended on the RPO order. I opened a new bug
[(906418)](https://bugzilla.mozilla.org/show_bug.cgi?id=906418)
and fixed it.

Then I did some performance profiling.
Unfortunately, although we have slight improvements in some benchmarks,
some programs in Octane and Kraken showed regression.
Performance analysis is the primary task of next week.

Deliverables:
-------------
[bug906418.patch](https://github.com/lazyparser/gsoc2013/blob/master/patches/bug906418.patch)
[LIR Reorder patch](https://github.com/lazyparser/gsoc2013/blob/master/block_reorder/reorderBlocksAfterRA.patch)


What I am planning to do next week:
-----------------------------------
Analyze the regression in Octane.
