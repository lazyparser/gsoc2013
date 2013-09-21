Weekly Report (2013-9-9 - 2013-9-15)
=====================================

What I have done:
-----------------
In this week I have fixed two bugs in the branch profiling patch:

1. In previous implementation when a basic block for loop header is seen,
we skip the "JSOP_NOP" or "JSOP_GOTO" bytecode right before the "JSOP_LOOPHEADER" bytecode,
and attch the counter for "JSOP_LOOPHEADER" to this block.
This is right for "JSOP_NOP", while for "JSOP_GOTO" the block should use the counter for
the subsequent "JSOP_LOOPENTRY" bytecode.

2. When a function call is inlined, the basic block which calls the function will be
divided into two blocks, namely BB0 and BB1. The "pc" of BB1 is not a jump target,
so we don't have a counter for it. In this case BB1 and BB0 will share the same counter,
and I use MBasicBlock::info()::script() to distinguish inlined blocks and BB0.

Deliverables:
-------------
[update branchProfiling.patch](https://github.com/lazyparser/gsoc2013/blob/master/patches/branchProfiling.patch)

What I am planning to do next week:
-----------------------------------
Keep trying to fix the regression in Octane and Kraken.

Preparing the Final Evaluation.
