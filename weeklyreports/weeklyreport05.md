Weekly Report (2013-7-15 - 2013-7-21)
=====================================

What I have done:
-----------------
In this week I submitted three patches. With these patches branch profiler is able
to be turned on/off through command line. Further more, the block counting codes
will be turned off dynamically when IonMonkey failed to compile hot methods.

Nicolas advised me to implement block reorder optimization first,
for branch pruning might break the assumptions holded by other optimizations,
e.g. Alias Analysis. We need to do more investigation before coding.

Deliverables:
-------------
[blockCounterToMBB.patch](https://github.com/lazyparser/gsoc2013/blob/master/patches/blockCounterToMBB.patch)

[toggleProfiling.patch](https://github.com/lazyparser/gsoc2013/blob/master/patches/toggleProfiling.patch)

[dynamicToggleProfiling.patch](https://github.com/lazyparser/gsoc2013/blob/master/patches/dynamicToggleProfiling.patch)

What I am planning to do next week:
-----------------------------------
1. Improve the order of blocks in rpo, based on [bug 844779](https://bugzilla.mozilla.org/show_bug.cgi?id=844779)

2. Patch [IonGraph](https://github.com/sstangl/iongraph) to make it able to show the block counters.

3. Profile baseline generated code with dummy counting codes to assess the performance impacts.
