---
title: Hadoop 2.2 Single Node Installation on CentOS 6.5
description: Hướng dẫn cài đặt Hadoop 2.2 chạy một node (single-node) trên CentOS 6.5, kèm các bài test cơ bản; lược dịch từ tutorial của Alan Johnson.
date: 2014-03-19T13:14:14+00:00
url: /hadoop-2-2-single-node-installation-on-centos-6-5/
categories:
  - Hadoop
  - IT
  - Linux
tags:
  - centos
  - Hadoop
  - install hadoop
  - java
  - map reduce
  - openjdk
---
> **Update (2026):** Hướng dẫn này đã rất cũ. CentOS 6 đã hết hỗ trợ từ 11/2020 (CentOS 8 cũng đã bị thay bằng CentOS Stream), Java 7 và Hadoop 2.2 đều đã EOL. Ngày nay nên dùng Hadoop 3.x trên một bản Linux còn được hỗ trợ (ví dụ Rocky Linux, AlmaLinux hoặc Ubuntu LTS) với OpenJDK 8 hoặc 11 theo tài liệu của Apache Hadoop, hoặc dùng container/dịch vụ đám mây. Các screenshot gốc (host trên wordpress.com) không còn, nên bài chỉ giữ lại phần lệnh và cấu hình. Cấu hình `fs.default.name`, `dfs.name.dir`, `dfs.data.dir` nay là tên cũ (deprecated); tên mới là `fs.defaultFS`, `dfs.namenode.name.dir`, `dfs.datanode.data.dir`.

Source: <http://alanxelsys.com/2014/02/01/hadoop-2-2-single-node-installation-on-centos-6-5/> (trang gốc có thể không còn truy cập được). By far the best tutorial I found for getting started with Hadoop installation.

## Introduction

This HOWTO covers Hadoop 2.2 installation on CentOS 6.5. The tutorials are meant just as that: tutorials. The intent is to let the user gain familiarity with the application, not to serve as a best-practices document for production, so performance, reliability and security considerations are compromised. The document covers only the bare minimum to get a **single node** cluster up and running, with emphasis on HOW rather than WHY. For more in-depth information, consult publications such as Tom White's *Hadoop: The Definitive Guide* (3rd edition) and Eric Sammer's *Hadoop Operations*, along with the Apache Hadoop website.

## Prerequisites

- CentOS 6.5 installed.

### Machine configuration

The original used a physical machine, but VMware Workstation or [VirtualBox](https://www.virtualbox.org/) work just as well. An additional network adapter and drive were added; 2GB of memory is sufficient for the tutorial.

### User configuration

If installing CentOS from scratch, select a user `hadoopuser` at installation time; otherwise add it with the commands below. Also create a group called `hadoopgroup`. The initial configuration is done as `root`.

```bash
passwd hadoopuser                    # enable login for this user
usermod -g hadoopgroup hadoopuser    # make hadoopuser a member of hadoopgroup
id hadoopuser                        # verify
```

Next, give `hadoopuser` sudo access by running `visudo` and adding a line for the user. Reboot and log in as `hadoopuser`.

### Setting up SSH

Set up password-less SSH authentication using keys.

```bash
ssh-keygen -t rsa -P ''
sudo chown hadoopuser ~/.ssh
sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
sudo chmod 600 ~/.ssh/authorized_keys
```

Then edit `/etc/ssh/sshd_config` as described in the original tutorial (public-key authentication enabled), and verify that you can log in to localhost without a password.

### Installing and configuring Java

It is recommended to install the full OpenJDK package to get the Java tools:

```bash
yum install java-1.7.0-openjdk*
java -version
```

`/etc/alternatives` contains a link to the Java installation; do a long listing of it and use that location as `JAVA_HOME`. Set the `JAVA_HOME` environment variable in `~/.bashrc`.

## Installing Hadoop

### Downloading Hadoop

From the [Hadoop releases page](https://hadoop.apache.org/releases.html), download `hadoop-2.2.0.tar.gz` from one of the mirrors, then:

```bash
tar xzvf hadoop-2.2.0.tar.gz
sudo mv hadoop-2.2.0 /usr/local/hadoop
sudo chown -R hadoopuser:hadoopgroup /usr/local/hadoop
mkdir -p ~/hadoopspace/hdfs/namenode
mkdir -p ~/hadoopspace/hdfs/datanode
```

### Configuring Hadoop

Edit `~/.bashrc` to set up the environment variables for Hadoop:

```bash
# User specific aliases and functions
export HADOOP_INSTALL=/usr/local/hadoop
export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_HOME=$HADOOP_INSTALL
export HADOOP_HDFS_HOME=$HADOOP_INSTALL
export YARN_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
export PATH=$PATH:$HADOOP_INSTALL/sbin
export PATH=$PATH:$HADOOP_INSTALL/bin
```

Apply the variables with `source ~/.bashrc`.

Several files in `/usr/local/hadoop/etc/hadoop/` need editing: `mapred-site.xml`, `yarn-site.xml`, `core-site.xml`, `hdfs-site.xml` and `hadoop-env.sh`. In each XML file, add the following between the `<configuration>` tags.

**mapred-site.xml** (first copy it from `mapred-site.xml.template`):

```xml
<property>
  <name>mapreduce.framework.name</name>
  <value>yarn</value>
</property>
```

**yarn-site.xml**:

```xml
<property>
  <name>yarn.nodemanager.aux-services</name>
  <value>mapreduce_shuffle</value>
</property>
```

**core-site.xml**:

```xml
<property>
  <name>fs.default.name</name>
  <value>hdfs://localhost:9000</value>
</property>
```

**hdfs-site.xml**:

```xml
<property>
  <name>dfs.replication</name>
  <value>1</value>
</property>
<property>
  <name>dfs.name.dir</name>
  <value>file:///home/hadoopuser/hadoopspace/hdfs/namenode</value>
</property>
<property>
  <name>dfs.data.dir</name>
  <value>file:///home/hadoopuser/hadoopspace/hdfs/datanode</value>
</property>
```

Other HDFS locations can be used by separating values with a comma.

**hadoop-env.sh**: add an entry for `JAVA_HOME`:

```bash
export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64/
```

(Actually you don't need to set `JAVA_HOME` here if you already did it in `~/.bashrc`.)

Next, format the namenode, then start the daemons:

```bash
hdfs namenode -format
start-dfs.sh
start-yarn.sh
```

Run `jps` and verify that the NameNode, DataNode, SecondaryNameNode, ResourceManager and NodeManager processes are running. At this point Hadoop is installed and configured.

## Testing the installation

Several test jobs exist to benchmark Hadoop. Running the tests jar without arguments lists the available tests.

`TestDFSIO` measures I/O performance: first create the files, then read them.

```bash
hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.2.0-tests.jar TestDFSIO -write -nrFiles 10 -fileSize 100
hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.2.0-tests.jar TestDFSIO -read -nrFiles 10 -fileSize 100
```

Results are logged in `TestDFSIO_results.log`, which shows throughput rates. During the run a tracking URL is printed; paste it into a browser to follow the job.

Another test is `mrbench`, a map/reduce test:

```bash
hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.2.0-tests.jar mrbench -maps 100
```

Finally, the following calculates pi. The first parameter is the number of maps, the second the number of samples per map (accuracy improves by increasing the second value):

```bash
hadoop jar $HADOOP_INSTALL/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.2.0.jar pi 10 20
```

## Working from the command line

Invoking a command without parameters, or with insufficient ones, generally prints help:

```bash
hdfs dfsadmin -help
hadoop version
```

## Web access

- NameNode status: <http://localhost:50070/> (status information, filesystem browser, NameNode logs).
- Secondary NameNode: port 50090.

## Online documentation

Comprehensive documentation is on the Apache website, or locally at `$HADOOP_INSTALL/share/doc/hadoop/index.html`.

Feedback, corrections and suggestions are welcome, as are suggestions for further HOWTOs.
