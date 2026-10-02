---
title: Hadoop 2.2 and Flume 1.4 Protobuf Problem and Solution
description: Cách khắc phục lỗi VerifyError do xung đột phiên bản protobuf khi dùng Flume 1.4 ghi vào HDFS của Hadoop 2.2.
date: 2014-04-15T06:45:30+00:00
url: /hadoop-2-2-and-flume-1-4-protobuf/
categories:
  - Big Data
  - Hadoop
tags:
  - apache
  - big data
  - flume
  - Hadoop
  - protobuf
  - protobuf incompatible
---
> **Update (2026):** Bài viết áp dụng cho Hadoop 2.2 và Flume 1.4 (2014). Lỗi này đã được khắc phục từ các bản Flume sau đó (Flume 1.5 trở đi dùng protobuf 2.5), nên nếu dùng phiên bản hiện đại bạn sẽ không gặp. Hadoop 2.2 cũng đã hết vòng đời hỗ trợ từ lâu.

Big thanks to Alex Holmes, author of "Hadoop in Practice". Source: <http://grepalex.com/2014/02/09/flume-and-hadoop-2.2/> (có thể không còn truy cập được).

The problem you may encounter when integrating Hadoop 2.2 with Flume 1.4 is the incompatibility between protobuf versions:

```
2014-04-15 13:56:23,251 (SinkRunner-PollingRunner-DefaultSinkProcessor) [ERROR - org.apache.flume.sink.hdfs.HDFSEventSink.process(HDFSEventSink.java:422)] process failed
java.lang.VerifyError: class org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$RecoverLeaseRequestProto overrides final method getUnknownFields.()Lcom/google/protobuf/UnknownFieldSet;
    at java.lang.ClassLoader.defineClass1(Native Method)
    at java.lang.ClassLoader.defineClass(ClassLoader.java:800)
    ...
    at org.apache.hadoop.ipc.ProtobufRpcEngine.getProxy(ProtobufRpcEngine.java:92)
    at org.apache.hadoop.ipc.RPC.getProtocolProxy(RPC.java:537)
    at org.apache.hadoop.hdfs.NameNodeProxies.createNNProxyWithClientProtocol(NameNodeProxies.java:328)
    ...
    at org.apache.flume.sink.hdfs.BucketWriter$1.call(BucketWriter.java:226)
    ...
    at java.lang.Thread.run(Thread.java:744)
```

(The full stack trace is truncated here for readability.)

## The explanation (from the original post)

> Google really screwed the pooch with their protobuf 2.5 release. Code generated with protobuf 2.5 is binary incompatible with older protobuf libraries (I guess Google missed the [semantic versioning](http://semver.org/) boat on this release). Unfortunately the current stable release of Flume 1.4 packages protobuf 2.4.1 and if you try and use HDFS on Hadoop 2.2 as a sink you'll be smacked with the following exception:
>
>     java.lang.VerifyError: class org.apache.hadoop.security.proto.SecurityProtos$GetDelegationTokenRequestProto
>     overrides final method getUnknownFields.()Lcom/google/protobuf/UnknownFieldSet;
>         at java.lang.ClassLoader.defineClass1(Native Method)
>         ...
>
> Hadoop 2.2 uses protobuf 2.5 for its RPC, and Flume loads its older packaged version of protobuf ahead of Hadoop's, which causes this error. To fix this you'll need to move both protobuf and guava out of Flume's lib directory. The following command moves them into your home directory.
>
>     $ mv ${flume_bin}/lib/{protobuf-java-2.4.1.jar,guava-10.0.1.jar} ~/
>
> Now if you restart your Flume agent you'll be able to target HDFS as a sink with Hadoop 2.2. Great success!
>
> Flume's next release will [move to protobuf 2.5](https://issues.apache.org/jira/browse/FLUME-2172) so this problem should magically disappear in due course.

## Solution in short

```bash
mv ${flume_bin}/lib/{protobuf-java-2.4.1.jar,guava-10.0.1.jar} ~/
```

Then restart the Flume agent.
