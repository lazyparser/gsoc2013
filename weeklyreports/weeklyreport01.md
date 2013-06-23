Weekly Report (2013-6-17 - 2013-6-23)
=====================================

What I have done:
-----------------
In this week I have collected full branch profiles for Octane benchmark by instrumenting the interpreter to output the branch targets. The aim is to investigate which programs may benefit from the branch pruning optimization.

Deliverables:
-------------
[Branch profiling data for Octane benchmark.](https://github.com/lazyparser/gsoc2013/tree/master/preexperiments/octane)

[A patch for instrumenting the interpreter](https://github.com/lazyparser/gsoc2013/blob/master/patches/instrument-interpreter.patch)

What I am planning to do next week:
-----------------------------------
Implement the Branch Profiler using the circular buffer data structure.
