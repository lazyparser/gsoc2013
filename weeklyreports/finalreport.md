Final Report
============

The day has come, and this is the last weekly report under the GSoC 2013 program.
In this report I will wrap up all things I have done and the status of my work.
I would like to emphasize that it is not the end of my contribution to Mozilla.
On the contrary, it is just the end of beginning.

Meta Bugs
---------

* [Bug 877872 - \[meta\] Optimize IonMonkey code with profiling of JavaScript branches](https://bugzilla.mozilla.org/show_bug.cgi?id=877872)

This is the meta bug of this project which consist of a branch profiler, a LIR block reordering optimization, and some auxiliary patches.

Status: in progress.

Pre-experiments
---------------

I have done some pre-experiments to investigate which programs may benefit from profile guided optimizations.
I have collected full branch profiles for Octane, Kraken and SunSpider benchmark by
instrumenting the interpreter to output the branch targets.
I observed plenty of branches which could not be proved dead were rarely executed can be
filtered out or reordered to speed up the JITed codes.
The other conclusion is that hot loops would overwrite previous branch information very quickly,
so after discussing with my mentor I switched to block counter solution.

Status: finished.

Branch Profiler
---------------

* [Bug 877878 - Instrument Baseline generated code to collect branch profiles](https://bugzilla.mozilla.org/show_bug.cgi?id=877878)

When a JSScript is compiled by the Baseline compiler,
the branch profiler instruments any bytecode which is the target of any jumps.
If a bytecode could be jumped to, or it is the entry of the JSScript,
the branch profiler allocates a counter for it.
The counters are organized as an array, attached to the end of the BaselineScript structure.

When the JSScript is compiled by the IonMonkey compiler, a control flow graph is generated.
The branch profiler tries to attach the value of counters to the basic blocks right after
the Critical Edge Split pass is finished.

The patch for the branch profiler has been submitted and reviewed. It will be checked in
after we see performance improvements from subsequent optimizations.

Status: review+

LIR Reordering Optimization
---------------------------

* [Bug 901221 - IonMonkey: Reorder LIR blocks based on branch profiling data](https://bugzilla.mozilla.org/show_bug.cgi?id=901221)

In my orginal proposal I intended to remove infrequently used basic blocks from the control flow graph.
But SpiderMonkey does not support such operations currently, removing blocks might break the assumptions
holded by other optimizations.
After discussed with my mentor we decided to move the infrequently blocks out of hot blocks and attach them
to the end of the list of blocks.

The implementation of this optimization is finished, while the performance improvements are not stable yet.
Performance tuning was the most time consuming task among all the works I have done.
Currently it still causes regression on a few programs of Octane benchmark, and I will keep working on it.

Status: feedback+

Auxiliary Patches
----------------

* [Bug 906418 - IonMonkey: Decouple the stack state from graph traversal order of LIR blocks](https://bugzilla.mozilla.org/show_bug.cgi?id=906418)

This is an auxiliary patch for bug 901221. LIRGraph saves the current state of stack on graph level,
which assumes all the blocks are in RPO order. This patch allocates a vector for each LIR block
which represents the stack stat at the entry of the block.

Status: finished, waiting for bug 901221.


* [Bug 896783 - Make IonSpewer and IonGraph output the branch profiling data for each MBasicBlock](https://bugzilla.mozilla.org/show_bug.cgi?id=896783)

This is an auxiliary patch for bug 877878. It lets the IonSpewer and IonGraph see the branch profiles.

Status (IonGraph part): checked in

Status (IonMonkey part): review+

Source Codes
------------
All the codes have been attached in the corresponding bugs as patches.
You can also view and download them from [github](https://github.com/lazyparser/gsoc2013).

In the End
----------
In the end I would like to say thank you to Nicolas B. Pierron (:nbp), my mentor.
I wouldn't have achieved it without his help. He is a nice and inspiring guy.
Both his public comments and private replies are always warm and encouraging.
I'm so lucky to be able to work with him.

I want to thank Hannes Verschore (:h4writer), Kannan Vijayan (:djvj),
Marty Rosenberg (:mjrosenb) and Sean Stangl (:sstangl),
for their kind suggestions and help.
Thank Ryan VanderMeulen (:RyanVM) for checking in patches for me.

