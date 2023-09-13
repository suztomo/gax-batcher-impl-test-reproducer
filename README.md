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
$ mvn install --errors --no-transfer-progress -Dcheckstyle.skip -T 10C
```


```
 mvn test --errors --no-transfer-progress -Dcheckstyle.skip -T 10C -Dtest=BatcherImplTest
```
