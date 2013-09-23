Weekly Report (2013-9-16 - 2013-9-22)
=====================================

What I have done:
-----------------
In this week I have investigated and fixed several corner cases in branch profiling.
I fixed the counter missing issues caused by 'FunctionDispatch' and 'TypeObjectDispatch'.
The issue with 'TableSwitch' has been identified and temporarily bypassed,
and I will fix it next week.

I have also updated the LIR reorder patch, following the suggestions from my mentor.
Currently the overall performance is better than previous version,
while the improvement compare with baseline (without profling and reordering) is still not significant.

Deliverables:
-------------
[branchProfiling.patch](https://github.com/lazyparser/gsoc2013/blob/master/patches/branchProfiling.patch)

[moveLBlocksByLikelyhood.patch](https://github.com/lazyparser/gsoc2013/blob/master/patches/moveLBlocksByLikelyhood.patch)

What I am planning to do next week:
-----------------------------------
Fix 'TableSwitch' issue in branch profiling patch.

Investigate the box2d program which is part of the Octane benchmark.

