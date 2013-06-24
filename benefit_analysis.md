Benefit Analysis for Branch Pruning
===================================

## Motivation
Before implementing the branch pruning optimization we want to collect some branch profiling data to evaluate the potential benefits we might gain.

## Method
We instrumented the interpreter in SpiderMonkey and collected all 13 javascript programs in Octane benchmark.

Bench profiles and the patch for instruminting the interpreter are available at:

[Patch for instruminting the interpreter](https://github.com/lazyparser/gsoc2013/blob/master/patches/instrument-interpreter.patch)

[Bench Profiles for Octane](https://github.com/lazyparser/gsoc2013/tree/master/preexperiments/octane)

[Bench Profiles for SunSpider](https://github.com/lazyparser/gsoc2013/tree/master/preexperiments/sunspider)

We instrumented ten SpiderMonkey opcodes: IFEQ, IFNE, AND, OR, CASE, LT, LE, GT, GE, IN, and GOTO.
We also instrumented the "BRANCH" macro used in `js/src/jsinterp.h` in order to get the address a branch jumped to.
The interpreter outputs the address of these opcodes.
For IFEQ, IFNE, AND, OR, and CASE, it also outputs the result that the branch was taken or not.
We use these information to simplify our analysis.
For other conditional jumps, this information are able to be infered by checking the type of the subsequent output:
if it is BRANCH, then the jump are occured; otherwise the jump are not occured.
The address of GOTO and the target address it jumps to are also outputed, for the integrity of the branch profiles.

We leveraged IonSpewer to print profiling data.
Since we only intrumented the interpreter, all Just-In-Time compilers in SpiderMonkey are disabled during our experiment:

> IONFLAGS=BranchProfile ./js --no-ion --no-jm --no-baseline javascript-file-name.js

## Conclusion
The optimization opportunities we have found are promising.
We observed plenty of branches which could not be proved dead were rarely executed can be filtered out to speed up the JITed codes.

## Details

[Overall Statistics](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/octane.statistics.csv)

[box2d.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/box2d.js.branch_profile.csv)

[code-load.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/code-load.js.branch_profile.csv)

[crypto.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/crypto.js.branch_profile.csv)

[deltablue.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/deltablue.js.branch_profile.csv)

[earley-boyer.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/earley-boyer.js.branch_profile.csv)

[gbemu.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/gbemu.js.branch_profile.csv)

[mandreel.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/mandreel.js.branch_profile.csv)

[navier-stokes.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/navier-stokes.js.branch_profile.csv)

[pdfjs.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/pdfjs.js.branch_profile.csv)

[raytrace.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/raytrace.js.branch_profile.csv)

[regexp.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/regexp.js.branch_profile.csv)

[richards.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/richards.js.branch_profile.csv)

[splay.js](https://github.com/lazyparser/gsoc2013/blob/master/benefit_analysis/splay.js.branch_profile.csv)

