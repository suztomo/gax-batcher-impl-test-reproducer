# gax-batcher-impl-test-reproducer

A Maven project to reproduce GAX's flaky BatcherImplTest https://github.com/googleapis/sdk-platform-java/issues/1193

# How to run

Prepare gax-test01 to gax-test09:

```
$ sh replicate_module.sh
```

# Run the test

Run the test with Maven's concurrency option:

```
~/gax-batcher-impl-test-reproducer$ mvn test --errors --no-transfer-progress -Dcheckstyle.skip -T 2C -Dtest='BatcherImplTest#testThrottlingBlocking'
```

With 16 core CPU Linux machine, some modules fail (32 concurrency):

```
[INFO] Results:
[INFO] 
[ERROR] Failures: 
[ERROR]   BatcherImplTest.testThrottlingBlocking:899 
apiCallContext.withOption(
    <Capturing argument>,
    <Capturing argument>
);
Wanted 1 time:
-> at com.google.api.gax.batching.BatcherImplTest.testThrottlingBlocking(BatcherImplTest.java:899)
But was 0 times.

[INFO] 
[ERROR] Tests run: 1, Failures: 1, Errors: 0, Skipped: 0

...

[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for batcher-impl-test-reproducer-parent 0.1.0-SNAPSHOT:
[INFO] 
[INFO] batcher-impl-test-reproducer-parent ................ SUCCESS [  0.010 s]
[INFO] gax-test00 ......................................... SUCCESS [ 10.489 s]
[INFO] gax-test01 ......................................... SUCCESS [ 10.758 s]
[INFO] gax-test02 ......................................... SUCCESS [ 10.730 s]
[INFO] gax-test03 ......................................... SUCCESS [ 10.441 s]
[INFO] gax-test04 ......................................... SUCCESS [ 10.350 s]
[INFO] gax-test05 ......................................... SUCCESS [  9.250 s]
[INFO] gax-test06 ......................................... SUCCESS [ 10.530 s]
[INFO] gax-test07 ......................................... SUCCESS [ 10.312 s]
[INFO] gax-test08 ......................................... SUCCESS [ 10.648 s]
[INFO] gax-test09 ......................................... SUCCESS [ 10.472 s]
[INFO] gax-test10 ......................................... SUCCESS [  9.150 s]
[INFO] gax-test11 ......................................... SUCCESS [ 10.308 s]
[INFO] gax-test12 ......................................... SUCCESS [  9.242 s]
[INFO] gax-test13 ......................................... SUCCESS [ 10.615 s]
[INFO] gax-test14 ......................................... SUCCESS [ 10.509 s]
[INFO] gax-test15 ......................................... SUCCESS [ 10.552 s]
[INFO] gax-test16 ......................................... SUCCESS [ 10.549 s]
[INFO] gax-test17 ......................................... SUCCESS [ 10.600 s]
[INFO] gax-test18 ......................................... SUCCESS [ 10.579 s]
[INFO] gax-test19 ......................................... SUCCESS [ 10.192 s]
[INFO] gax-test20 ......................................... SUCCESS [  9.587 s]
[INFO] gax-test21 ......................................... FAILURE [ 10.294 s]
[INFO] gax-test22 ......................................... SUCCESS [ 10.314 s]
[INFO] gax-test23 ......................................... SUCCESS [  9.835 s]
[INFO] gax-test24 ......................................... SUCCESS [ 10.475 s]
[INFO] gax-test25 ......................................... SUCCESS [ 10.474 s]
[INFO] gax-test26 ......................................... SUCCESS [ 10.193 s]
[INFO] gax-test27 ......................................... FAILURE [  9.258 s]
[INFO] gax-test28 ......................................... SUCCESS [ 10.005 s]
[INFO] gax-test29 ......................................... SUCCESS [ 10.282 s]
[INFO] gax-test30 ......................................... SUCCESS [ 10.624 s]
[INFO] gax-test31 ......................................... SUCCESS [ 10.391 s]
[INFO] gax-test32 ......................................... SUCCESS [  2.578 s]
[INFO] gax-test33 ......................................... SUCCESS [  2.489 s]
[INFO] gax-test34 ......................................... SUCCESS [  2.451 s]
```

I tried on my MacBook Pro (4 cores) but I couldn't reproduce the issue. Use gLinux.
