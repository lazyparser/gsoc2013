Weekly Report (2013-8-5 - 2013-8-11)
=====================================

What I have done:
-----------------
I've implemented a transformation which reorders LBlocks on LIRGraph.
It moves the blocks which are unlikely to be executed to the end of block list.
Although the idea and algorithm are simple, We've encountered some SIGSEGV bugs,
which were hard to debug. I discussed these issue with my mentor and followed
his advices, but sadly I could not catch the culprit yet.

Deliverables:
-------------

[reorder_LBlocks](https://github.com/lazyparser/gsoc2013/tree/master/block_reorder)

[update branchProfiling.patch](https://github.com/lazyparser/gsoc2013/blob/master/patches/branchProfiling.patch)


What I am planning to do next week:
-----------------------------------
Fix the bugs hidding in the LBlock reorder patch.
Do perf profiling once the bugs are fixed.
