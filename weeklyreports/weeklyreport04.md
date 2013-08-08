Weekly Report (2013-7-8 - 2013-7-14)
=====================================

What I have done:
-----------------
In this week I finished a prototype version of the branch profiler. For each bytecode which is the target of
any jumps, branch profiler allocates a counter for it. Then the value of counters are propogated to
MBasicBlock right after the Critical Edge Analysis is finished.

I also done proformance profiling for the instrumentation patch. It caused 0.3% ~ 0.7% regression on my machine.
However the profiling result was not stable, and more accurate assessments are required.

Deliverables:
-------------

[blockCounterWithoutConditions.patch](https://github.com/lazyparser/gsoc2013/blob/master/patches/obsolete/blockCounterWithoutConditions.patch)

[blockCounterTesting.patch](https://github.com/lazyparser/gsoc2013/blob/master/patches/obsolete/blockCounterTesting.patch)

[Block Counter Profiles](https://github.com/lazyparser/gsoc2013/tree/master/block_counter_dump)


What I am planning to do next week:
-----------------------------------
Begin to implement the Branch Pruning pass.
