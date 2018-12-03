#!/bin/sh

tests=0
fails=0

echo -n >test.log

run() {
    tests=$(( $tests + 1 ))
    if sh -c "( $* ) >>test.log 2>&1"; then
        echo -n '.'
    else
        fails=$(( $fails + 1 ))
        echo -n 'F'
    fi
}

for i in pngsuite/*.png; do
    for j in RGB RGBA GRAY GA; do
	for k in 8 16; do
    for p in PB PB2; do
	    out=$i.$j.$k.out
	    run "./convert_color_space $j $k $p $i $out && cmp $out cmp/$out"
	done;
    done;
    done;
done

for i in 1 2 4; do
    in=pngsuite/basn0g0$i.png
    out=$in.out
    run "./read_write_gray_packed $i $in $out && cmp $out cmp/$out"
done

run ./generate_gray_packed
for i in 1 2 4; do
    out=gray_packed_$i.png.out
    run "cmp $out cmp/$out"
done

run ./generate_palette
for i in 1 2 4 8; do
    out=palette$i.png.out
    run "cmp $out cmp/$out"
done
run "cmp palette8_tRNS.png.out cmp/palette8_tRNS.png.out"

run "./write_gray_16 && cmp gray_16.out cmp/gray_16.out"

echo "\n=================="

if [ $fails -eq 0 ]; then
    echo "PNG++ passes tests (all $tests passed)"
    test -s test.log && echo "warning: test.log is not empty\n"
    exit 0
else
    echo "PNG++ FAILS TESTS ($fails OF $tests FAILED)"
    echo "review test.log for clues\n"
    exit 1
fi
