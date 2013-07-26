#!/bin/bash

workdir=$HOME
outputdir=$workdir/results/
[ -d $outputdir ] || mkdir -p $outputdir || exit

baselineJS=$workdir/_baseline.opt/js
instrumentedJS=$workdir/_instrumenting.opt/js
dummyJS=$workdir/_dummy.opt/js
activeJS=$workdir/_active.opt/js

benchmarkdir=$workdir/awfy/benchmarks/
sunspiderdir=$benchmarkdir/SunSpider
krakendir=$benchmarkdir/kraken
octanedir=$benchmarkdir/octane

args_common=''
args_on="$args_common --branch-profiling=on"
args_off="$args_common --branch-profiling=off"

for runs in 1 10 50 100; do
	pushd $sunspiderdir || continue
	./sunspider --shell=$baselineJS      --runs=$runs                       --suite='sunspider-1.0' > $outputdir/ss.base.$runs.ion.txt
	./sunspider --shell=$activeJS        --runs=$runs                       --suite='sunspider-1.0' > $outputdir/ss.active.$runs.ion.txt
	./sunspider --shell=$instrumentedJS  --runs=$runs --args="$args_on"     --suite='sunspider-1.0' > $outputdir/ss.on.$runs.ion.txt
	./sunspider --shell=$instrumentedJS  --runs=$runs --args="$args_off"    --suite='sunspider-1.0' > $outputdir/ss.off.$runs.ion.txt
	./sunspider --shell=$dummyJS         --runs=$runs                       --suite='sunspider-1.0' > $outputdir/ss.dummy.$runs.ion.txt
	popd
	pushd $krakendir || continue
	./sunspider --shell=$baselineJS      --runs=$runs                       --suite='kraken-1.1' > $outputdir/kk.base.$runs.ion.txt
	./sunspider --shell=$activeJS        --runs=$runs                       --suite='kraken-1.1' > $outputdir/kk.active.$runs.ion.txt
	./sunspider --shell=$instrumentedJS  --runs=$runs --args="$args_on"     --suite='kraken-1.1' > $outputdir/kk.on.$runs.ion.txt
	./sunspider --shell=$instrumentedJS  --runs=$runs --args="$args_off"    --suite='kraken-1.1' > $outputdir/kk.off.$runs.ion.txt
	./sunspider --shell=$dummyJS         --runs=$runs                       --suite='kraken-1.1' > $outputdir/kk.dummy.$runs.ion.txt
	popd
	pushd $octanedir || continue
	$baselineJS        $args_common    run.js > $outputdir/octane.base.$runs.ion.txt
	$activeJS          $args_common    run.js > $outputdir/octane.active.$runs.ion.txt
	$instrumentedJS    $args_on        run.js > $outputdir/octane.on.$runs.ion.txt
	$instrumentedJS    $args_off       run.js > $outputdir/octane.off.$runs.ion.txt
	$dummyJS           $args_common    run.js > $outputdir/octane.octane.$runs.ion.txt
	popd
done


args_common='--no-ion'
args_on="$args_common --branch-profiling=on"
args_off="$args_common --branch-profiling=off"

for runs in 1 10 50 100; do
	pushd $sunspiderdir || continue
	./sunspider --shell=$baselineJS      --runs=$runs --args="$args_common" --suite='sunspider-1.0' > $outputdir/ss.base.$runs.no-ion.txt
	./sunspider --shell=$activeJS        --runs=$runs --args="$args_common" --suite='sunspider-1.0' > $outputdir/ss.active.$runs.no-ion.txt
	./sunspider --shell=$instrumentedJS  --runs=$runs --args="$args_on"     --suite='sunspider-1.0' > $outputdir/ss.on.$runs.no-ion.txt
	./sunspider --shell=$instrumentedJS  --runs=$runs --args="$args_off"    --suite='sunspider-1.0' > $outputdir/ss.off.$runs.no-ion.txt
	./sunspider --shell=$dummyJS         --runs=$runs --args="$args_common" --suite='sunspider-1.0' > $outputdir/ss.dummy.$runs.no-ion.txt
	popd
	pushd $krakendir || continue
	./sunspider --shell=$baselineJS      --runs=$runs --args="$args_common" --suite='kraken-1.1' > $outputdir/kk.base.$runs.no-ion.txt
	./sunspider --shell=$activeJS        --runs=$runs --args="$args_common" --suite='kraken-1.1' > $outputdir/kk.active.$runs.no-ion.txt
	./sunspider --shell=$instrumentedJS  --runs=$runs --args="$args_on"     --suite='kraken-1.1' > $outputdir/kk.on.$runs.no-ion.txt
	./sunspider --shell=$instrumentedJS  --runs=$runs --args="$args_off"    --suite='kraken-1.1' > $outputdir/kk.off.$runs.no-ion.txt
	./sunspider --shell=$dummyJS         --runs=$runs --args="$args_common" --suite='kraken-1.1' > $outputdir/kk.dummy.$runs.no-ion.txt
	popd
	pushd $octanedir || continue
	$baselineJS        $args_common    run.js > $outputdir/octane.base.$runs.no-ion.txt
	$activeJS          $args_common    run.js > $outputdir/octane.active.$runs.no-ion.txt
	$instrumentedJS    $args_on        run.js > $outputdir/octane.on.$runs.no-ion.txt
	$instrumentedJS    $args_off       run.js > $outputdir/octane.off.$runs.no-ion.txt
	$dummyJS           $args_common    run.js > $outputdir/octane.octane.$runs.no-ion.txt
	popd
done


