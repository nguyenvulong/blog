---
title: Hadoop 2.2 and Flume 1.4 Protobuf Problem and Solution
author: admin
type: post
date: 2014-04-15T06:45:30+00:00
url: /hadoop-2-2-and-flume-1-4-protobuf/
al2fb_facebook_exclude:
  - 1
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
I have to say the big THANK to the author of  &#8220;Hadoop in Practice&#8221; : Alex Holmes

Source : http://grepalex.com/2014/02/09/flume-and-hadoop-2.2/

The problem you may encounter while  trying to integrate Hadoop 2.2 and Flume 1.4 is the incompatibility between protobuf versions :

<span style="color: #666699;"><em>2014-04-15 13:56:23,251 (SinkRunner-PollingRunner-DefaultSinkProcessor) [ERROR &#8211; org.apache.flume.sink.hdfs.HDFSEventSink.process(HDFSEventSink.java:422)] process failed</em></span>

<span style="color: #666699;"><em>java.lang.VerifyError: class org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$RecoverLeaseRequestProto overrides final method getUnknownFields.()Lcom/google/protobuf/UnknownFieldSet;</em></span>  
<span style="color: #666699;"><em> at java.lang.ClassLoader.defineClass1(Native Method)</em></span>  
<span style="color: #666699;"><em> at java.lang.ClassLoader.defineClass(ClassLoader.java:800)</em></span>  
<span style="color: #666699;"><em> at java.security.SecureClassLoader.defineClass(SecureClassLoader.java:142)</em></span>  
<span style="color: #666699;"><em> at java.net.URLClassLoader.defineClass(URLClassLoader.java:449)</em></span>  
<span style="color: #666699;"><em> at java.net.URLClassLoader.access$100(URLClassLoader.java:71)</em></span>  
<span style="color: #666699;"><em> at java.net.URLClassLoader$1.run(URLClassLoader.java:361)</em></span>  
<span style="color: #666699;"><em> at java.net.URLClassLoader$1.run(URLClassLoader.java:355)</em></span>  
<span style="color: #666699;"><em> at java.security.AccessController.doPrivileged(Native Method)</em></span>  
<span style="color: #666699;"><em> at java.net.URLClassLoader.findClass(URLClassLoader.java:354)</em></span>  
<span style="color: #666699;"><em> at java.lang.ClassLoader.loadClass(ClassLoader.java:425)</em></span>  
<span style="color: #666699;"><em> at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:308)</em></span>  
<span style="color: #666699;"><em> at java.lang.ClassLoader.loadClass(ClassLoader.java:358)</em></span>  
<span style="color: #666699;"><em> at java.lang.Class.getDeclaredMethods0(Native Method)</em></span>  
<span style="color: #666699;"><em> at java.lang.Class.privateGetDeclaredMethods(Class.java:2531)</em></span>  
<span style="color: #666699;"><em> at java.lang.Class.privateGetPublicMethods(Class.java:2651)</em></span>  
<span style="color: #666699;"><em> at java.lang.Class.privateGetPublicMethods(Class.java:2661)</em></span>  
<span style="color: #666699;"><em> at java.lang.Class.getMethods(Class.java:1467)</em></span>  
<span style="color: #666699;"><em> at sun.misc.ProxyGenerator.generateClassFile(ProxyGenerator.java:426)</em></span>  
<span style="color: #666699;"><em> at sun.misc.ProxyGenerator.generateProxyClass(ProxyGenerator.java:323)</em></span>  
<span style="color: #666699;"><em> at java.lang.reflect.Proxy.getProxyClass0(Proxy.java:636)</em></span>  
<span style="color: #666699;"><em> at java.lang.reflect.Proxy.newProxyInstance(Proxy.java:722)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.ipc.ProtobufRpcEngine.getProxy(ProtobufRpcEngine.java:92)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.ipc.RPC.getProtocolProxy(RPC.java:537)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.hdfs.NameNodeProxies.createNNProxyWithClientProtocol(NameNodeProxies.java:328)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.hdfs.NameNodeProxies.createNonHAProxy(NameNodeProxies.java:235)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.hdfs.NameNodeProxies.createProxy(NameNodeProxies.java:139)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.hdfs.DFSClient.<init>(DFSClient.java:510)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.hdfs.DFSClient.<init>(DFSClient.java:453)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.hdfs.DistributedFileSystem.initialize(DistributedFileSystem.java:136)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.fs.FileSystem.createFileSystem(FileSystem.java:2433)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.fs.FileSystem.access$200(FileSystem.java:88)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.fs.FileSystem$Cache.getInternal(FileSystem.java:2467)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.fs.FileSystem$Cache.get(FileSystem.java:2449)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.fs.FileSystem.get(FileSystem.java:367)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.fs.Path.getFileSystem(Path.java:287)</em></span>  
<span style="color: #666699;"><em> at org.apache.flume.sink.hdfs.BucketWriter$1.call(BucketWriter.java:226)</em></span>  
<span style="color: #666699;"><em> at org.apache.flume.sink.hdfs.BucketWriter$1.call(BucketWriter.java:220)</em></span>  
<span style="color: #666699;"><em> at org.apache.flume.sink.hdfs.BucketWriter$8$1.run(BucketWriter.java:536)</em></span>  
<span style="color: #666699;"><em> at org.apache.flume.sink.hdfs.BucketWriter.runPrivileged(BucketWriter.java:160)</em></span>  
<span style="color: #666699;"><em> at org.apache.flume.sink.hdfs.BucketWriter.access$1000(BucketWriter.java:56)</em></span>  
<span style="color: #666699;"><em> at org.apache.flume.sink.hdfs.BucketWriter$8.call(BucketWriter.java:533)</em></span>  
<span style="color: #666699;"><em> at java.util.concurrent.FutureTask.run(FutureTask.java:262)</em></span>  
<span style="color: #666699;"><em> at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)</em></span>  
<span style="color: #666699;"><em> at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)</em></span>  
<span style="color: #666699;"><em> at java.lang.Thread.run(Thread.java:744)</em></span>  
<span style="color: #666699;"><em>Exception in thread &#8220;SinkRunner-PollingRunner-DefaultSinkProcessor&#8221; java.lang.VerifyError: class org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$RecoverLeaseRequestProto overrides final method getUnknownFields.()Lcom/google/protobuf/UnknownFieldSet;</em></span>  
<span style="color: #666699;"><em> at java.lang.ClassLoader.defineClass1(Native Method)</em></span>  
<span style="color: #666699;"><em> at java.lang.ClassLoader.defineClass(ClassLoader.java:800)</em></span>  
<span style="color: #666699;"><em> at java.security.SecureClassLoader.defineClass(SecureClassLoader.java:142)</em></span>  
<span style="color: #666699;"><em> at java.net.URLClassLoader.defineClass(URLClassLoader.java:449)</em></span>  
<span style="color: #666699;"><em> at java.net.URLClassLoader.access$100(URLClassLoader.java:71)</em></span>  
<span style="color: #666699;"><em> at java.net.URLClassLoader$1.run(URLClassLoader.java:361)</em></span>  
<span style="color: #666699;"><em> at java.net.URLClassLoader$1.run(URLClassLoader.java:355)</em></span>  
<span style="color: #666699;"><em> at java.security.AccessController.doPrivileged(Native Method)</em></span>  
<span style="color: #666699;"><em> at java.net.URLClassLoader.findClass(URLClassLoader.java:354)</em></span>  
<span style="color: #666699;"><em> at java.lang.ClassLoader.loadClass(ClassLoader.java:425)</em></span>  
<span style="color: #666699;"><em> at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:308)</em></span>  
<span style="color: #666699;"><em> at java.lang.ClassLoader.loadClass(ClassLoader.java:358)</em></span>  
<span style="color: #666699;"><em> at java.lang.Class.getDeclaredMethods0(Native Method)</em></span>  
<span style="color: #666699;"><em> at java.lang.Class.privateGetDeclaredMethods(Class.java:2531)</em></span>  
<span style="color: #666699;"><em> at java.lang.Class.privateGetPublicMethods(Class.java:2651)</em></span>  
<span style="color: #666699;"><em> at java.lang.Class.privateGetPublicMethods(Class.java:2661)</em></span>  
<span style="color: #666699;"><em> at java.lang.Class.getMethods(Class.java:1467)</em></span>  
<span style="color: #666699;"><em> at sun.misc.ProxyGenerator.generateClassFile(ProxyGenerator.java:426)</em></span>  
<span style="color: #666699;"><em> at sun.misc.ProxyGenerator.generateProxyClass(ProxyGenerator.java:323)</em></span>  
<span style="color: #666699;"><em> at java.lang.reflect.Proxy.getProxyClass0(Proxy.java:636)</em></span>  
<span style="color: #666699;"><em> at java.lang.reflect.Proxy.newProxyInstance(Proxy.java:722)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.ipc.ProtobufRpcEngine.getProxy(ProtobufRpcEngine.java:92)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.ipc.RPC.getProtocolProxy(RPC.java:537)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.hdfs.NameNodeProxies.createNNProxyWithClientProtocol(NameNodeProxies.java:328)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.hdfs.NameNodeProxies.createNonHAProxy(NameNodeProxies.java:235)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.hdfs.NameNodeProxies.createProxy(NameNodeProxies.java:139)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.hdfs.DFSClient.<init>(DFSClient.java:510)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.hdfs.DFSClient.<init>(DFSClient.java:453)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.hdfs.DistributedFileSystem.initialize(DistributedFileSystem.java:136)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.fs.FileSystem.createFileSystem(FileSystem.java:2433)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.fs.FileSystem.access$200(FileSystem.java:88)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.fs.FileSystem$Cache.getInternal(FileSystem.java:2467)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.fs.FileSystem$Cache.get(FileSystem.java:2449)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.fs.FileSystem.get(FileSystem.java:367)</em></span>  
<span style="color: #666699;"><em> at org.apache.hadoop.fs.Path.getFileSystem(Path.java:287)</em></span>  
<span style="color: #666699;"><em> at org.apache.flume.sink.hdfs.BucketWriter$1.call(BucketWriter.java:226)</em></span>  
<span style="color: #666699;"><em> at org.apache.flume.sink.hdfs.BucketWriter$1.call(BucketWriter.java:220)</em></span>  
<span style="color: #666699;"><em> at org.apache.flume.sink.hdfs.BucketWriter$8$1.run(BucketWriter.java:536)</em></span>  
<span style="color: #666699;"><em> at org.apache.flume.sink.hdfs.BucketWriter.runPrivileged(BucketWriter.java:160)</em></span>  
<span style="color: #666699;"><em> at org.apache.flume.sink.hdfs.BucketWriter.access$1000(BucketWriter.java:56)</em></span>  
<span style="color: #666699;"><em> at org.apache.flume.sink.hdfs.BucketWriter$8.call(BucketWriter.java:533)</em></span>  
<span style="color: #666699;"><em> at java.util.concurrent.FutureTask.run(FutureTask.java:262)</em></span>  
<span style="color: #666699;"><em> at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)</em></span>  
<span style="color: #666699;"><em> at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)</em></span>  
<span style="color: #666699;"><em> at java.lang.Thread.run(Thread.java:744)</em></span>

<span style="color: #800000;"><strong>This is his  post :</strong></span>

> Google really screwed the pooch with their protobuf 2.5 release. Code generated with protobuf 2.5 is binary incompatible with older protobuf libraries (I guess Google missed the [semantic versioning][1] boat on this release). Unfortunately the current stable release of Flume 1.4 packages protobuf 2.4.1 and if you try and use HDFS on Hadoop 2.2 as a sink you’ll be smacked with the following exception:
> 
>     java.lang.VerifyError: class org.apache.hadoop.security.proto.SecurityProtos$GetDelegationTokenRequestProto
>     overrides final method getUnknownFields.()Lcom/google/protobuf/UnknownFieldSet;
>         at java.lang.ClassLoader.defineClass1(Native Method)
>         at java.lang.ClassLoader.defineClassCond(ClassLoader.java: 631)
>         ...
>         at org.apache.hadoop.ipc.ProtobufRpcEngine.getProxy(ProtobufRpcEngine.java: 92)
>         at org.apache.hadoop.ipc.RPC.getProtocolProxy(RPC.java: 537)
>         at org.apache.hadoop.hdfs.NameNodeProxies.createNNProxyWithClientProtocol(NameNodeProxies.java: 328)
>         at org.apache.hadoop.hdfs.NameNodeProxies.createNonHAProxy(NameNodeProxies.java: 235)
> 
> Hadoop 2.2 uses protobuf 2.5 for its RPC, and Flume loads its older packaged version of protobuf ahead of Hadoop’s, which causes this error. To fix this you’ll need to move both protobuf and guava out of Flume’s lib directory. The following command moves them into your home directory.
> 
>     $ mv ${flume_bin}/lib/{protobuf-java-2.4.1.jar,guava-10.0.1.jar} ~/
> 
> Now if you restart your Flume agent you’ll be able to target HDFS as a sink with Hadoop 2.2. Great success!
> 
> Flume’s next release will [move to protobuf 2.5][2] so this problem should magically disappear in due course.

 [1]: http://semver.org/
 [2]: https://issues.apache.org/jira/browse/FLUME-2172
