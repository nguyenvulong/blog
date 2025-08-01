---
title: Hadoop 2.2 Single Node Installation on CentOS 6.5
author: admin
type: post
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
By far the best tutorial for you to get started with Hadoop installation.

Source : http://alanxelsys.com/2014/02/01/hadoop-2-2-single-node-installation-on-centos-6-5/

**Introduction**

This HOWTO covers Hadoop 2.2 installation with CentOS 6.5. My series of tutorials are meant just as that – tutorials. The intent is to allow the user to gain familiarity with the application and should not be construed as any type of best practices document to be used in a production environment and as such performance, reliability and security considerations are compromised. The tutorials are freely available and may be distributed with the proper acknowledgements. Actual screenshots of the commands are used to eliminate any possibility of typographical errors, in addition long sequences of text are placed in front of the screenshots to facilitate copy and paste. Command text is printed using Courier font. In general the document will only cover the bare minimum of how to get a **_single node_** cluster up and running with the emphasis on HOW rather than WHY. For more in depth information the reader should consult the many excellent publications on Hadoop such as Tom White’s – Hadoop: The Definitive Guide, 3rd edition and Eric Sammer’s – Hadoop Operations along with the Apache Hadoop website.

Please consult [www.alan-johnson.net][1] for an online version of this document.

## Prerequisites

  * CentOS 6.5 installed

### Machine configuration

In this HOWTO a physical machine was used; but for educational purposes Vmware Workstation or Virtualbox (<a href="https: //www.virtualbox.org/" rel="nofollow">https://www.virtualbox.org/</a>) would work just as well. The screenshot below shows acceptable VM machine settings for VMWare.

**Note an additional Network Adapter and physical drive have been added. Memory allocation is 2GB which is sufficient for the tutorial.  
** 


![020114_2115_hadoop22sin1.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin1.png?w=640)


### User configuration

If installing CentOS from scratch then select a user <hadoopuser> at installation time otherwise the user can be added by the command below. In addition create a group called <hadoopgroup>.

**Note the initial configuration is done as user _root_.  
** 


![020114_2115_hadoop22sin2.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin2.png?w=640)


<span style="color: #0000ff;">=> passwd hadoopuser<br /> </span><span style="color: #0000ff;">to enable log-in for this one. </span>

Now make hadoopuser a member of hadoopgroup.

usermod –g hadoopgroup hadoopuser


![020114_2115_hadoop22sin3.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin3.png?w=640)


Verify by issuing the id command.ss

id hadoopuser


![020114_2115_hadoop22sin4.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin4.png?w=640)


The next step is to give _hadoopuser_ access to sudo commands. Do this by executing thevisudo command and adding the highlighted line shown below.


![020114_2115_hadoop22sin5.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin5.png?w=640)


Reboot and now log in as user _hadoopuser.  
_ 

### Setting up ssh

Setup ssh for password-less authentication using keys.

ssh-keygen -t rsa -P ”


![020114_2115_hadoop22sin6.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin6.png?w=640)


Next change file ownership and mode.

sudo chown hadoopuser ~/.ssh

sudo chmod 700 ~/.ssh

sudo chmod 600 ~/.ssh/id_rsa


![020114_2115_hadoop22sin7.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin7.png?w=640)


Then append the public key to the file authorized_keys

sudo cat ~/.ssh/id\_rsa.pub >> ~/.ssh/authorized\_keys


![020114_2115_hadoop22sin8.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin8.png?w=640)


Change permissions.

sudo chmod 600 ~/.ssh/authorized_keys


![020114_2115_hadoop22sin9.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin9.png?w=640)


Edit /etc/ssh/sshd_config


![020114_2115_hadoop22sin10.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin10.png?w=640)


Set PasswordAuthentication to no and allow empty passwords  
as shown below in the extract of the file.


![020114_2115_hadoop22sin11.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin11.png?w=640)


Verify that login can be accomplished without requiring a password.


![020114_2115_hadoop22sin12.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin12.png?w=640)


### Installing and configuring java

It is recommended to install the full openJDK package to take advantage of some of the java tools,

### Installing openJDK

yum install java-1.7.0-openjdk*


![020114_2115_hadoop22sin13.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin13.png?w=640)


After the installation verify the java version

java -version


![020114_2115_hadoop22sin14.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin14.png?w=640)


The folder etc/alternatives contains a link to the java installation; perform a long listing of the file to show the link and use it as the location for JAVA_HOME.


![020114_2115_hadoop22sin15.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin15.png?w=640)


Set the JAVA_HOME environmental variable by editing ~/.bashrc


![020114_2115_hadoop22sin16.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin16.png?w=640)


## Installing Hadoop

### Downloading Hadoop

From the Hadoop releases page <http: //hadoop.apache.org/releases.html> , download hadoop-2.2.0.tar.gz from one of the mirror sites.


![020114_2115_hadoop22sin17.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin17.png?w=640)


Next untar the file

tar xzvf hadoop-2.2.0.tar.gz


![020114_2115_hadoop22sin18.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin18.png?w=640)


Move the untarred folder

sudo mv hadoop-2.2.0 /usr/local/hadoop


![020114_2115_hadoop22sin19.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin19.png?w=640)


Change the ownership with sudo chown -R hadoopuser: hadoopgroup /usr/local/hadoop


![020114_2115_hadoop22sin20.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin20.png?w=640)


Next create namenode and datanode folders

mkdir -p ~/hadoopspace/hdfs/namenode

mkdir -p ~/hadoopspace/hdfs/datanode


![020114_2115_hadoop22sin21.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin21.png?w=640)


### Configuring Hadoop

Next edit ~/.bashrc to set up the environmental variables for Hadoop

\# User specific aliases and functions

export HADOOP_INSTALL=/usr/local/hadoop  
export HADOOP\_MAPRED\_HOME=$HADOOP_INSTALL  
export HADOOP\_COMMON\_HOME=$HADOOP_INSTALL  
export HADOOP\_HDFS\_HOME=$HADOOP_INSTALL  
export YARN\_HOME=$HADOOP\_INSTALL  
export HADOOP\_COMMON\_LIB\_NATIVE\_DIR=$HADOOP_INSTALL/lib/native  
export PATH=$PATH: $HADOOP_INSTALL/sbin  
export PATH=$PATH: $HADOOP_INSTALL/bin

Now apply the variables.


![020114_2115_hadoop22sin22.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin22.png?w=640)


There are a number of xml files within the Hadoop folder that require editing which are:

  * mapred-site.xml
  * yarn-site.xml
  * core-site.xml
  * hdfs-site.xml
  * hadoop-env.sh

The files can be found in /usr/local/hadoop/etc/hadoop/. First copy themapred-site template file over and then edit it.

mapred-site.xml


![020114_2115_hadoop22sin23.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin23.png?w=640)


Add the following text between the configuration tabs.

<property>  
<name>mapreduce.framework.name</name>  
<value>yarn</value>  
</property>

yarn-site.xml

Add the following text between the configuration tabs.

<property>  
<name>yarn.nodemanager.aux-services</name>  
<value>mapreduce_shuffle</value>  
</property>

core-site.xml

Add the following text between the configuration tabs.  
<property>  
<name>fs.default.name</name>  
<value>hdfs: //localhost:9000</value>  
</property>

hdfs-site.xml

Add the following text between the configuration tabs.

<property>  
<name>dfs.replication</name>  
<value>1</value>  
</property>

<property>  
<name>dfs.name.dir</name>  
<value>file: ///home/hadoopuser/hadoopspace/hdfs/namenode</value>  
</property>

<property>  
<name>dfs.data.dir</name>  
<value>file: ///home/hadoopuser/hadoopspace/hdfs/datanode</value>  
</property>

**Note other locations can be used in hdfs by separating values with a comma, e.g.  
**  
**file: /home/hadoopuser/hadoopspace/hdfs/datanode, .disk2/Hadoop/datanode, . .  
**  
hadoop-env.sh

Add an entry for JAVA_HOME

export JAVA\_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86\_64/

<span style="color: #0000ff;">=> Actually you don&#8217;t need to configure JAVA_HOME here since you&#8217;ve already done that in ~/.bashrc</span>

Next format the namenode.


![020114_2115_hadoop22sin24.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin24.png?w=640)


. . .

Issue the following commands.

start-dfs.sh  
start-yarn.sh


![020114_2115_hadoop22sin25.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin25.png?w=640)


Issue the jps command and verify that the following jobs are running:


![020114_2115_hadoop22sin26.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin26.png?w=640)


At this point Hadoop has been installed and configured

## Testing the installation

A number of test files exist that can be used to benchmark Hadoop. Entering the command below without any arguments will list available tests.


![020114_2115_hadoop22sin27.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin27.png?w=640)


The TestDFSIO test below can be used to measure read performance – initially create the files and then read:

hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.2.0-tests.jar TestDFSIO -write -nrFiles 10 -fileSize 100

hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.2.0-tests.jar TestDFSIO -read -nrFiles 10 -fileSize 100


![020114_2115_hadoop22sin28.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin28.png?w=640)



![020114_2115_hadoop22sin29.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin29.png?w=640)


The results are logged in TestDFSIO_results.log which will show throughput rates:


![020114_2115_hadoop22sin30.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin30.png?w=640)


During the test run a message will be printed with a tracking url such as that shown below:


![020114_2115_hadoop22sin31.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin31.png?w=640)


The link can be selected or the address can be pasted into a browser.


![020114_2115_hadoop22sin32.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin32.png?w=640)


Another test is mrbench which is a map/reduce test.

hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.2.0-tests.jar mrbench –maps 100


![020114_2115_hadoop22sin33.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin33.png?w=640)


Finally the test below is used to calculate pi. The first parameter refers to the number of maps and the second is the number of samples for each map.

hadoop jar $HADOOP_INSTALL/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.2.0.jar pi 10 20


![020114_2115_hadoop22sin34.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin34.png?w=640)


. . .


![020114_2115_hadoop22sin35.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin35.png?w=640)


**Note accuracy can be improved by increasing the value of the second parameter.  
** 

### Working from the command line

Invoking a command without any or insufficient parameters will generally print out help data”

### hdfs commands


![020114_2115_hadoop22sin36.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin36.png?w=640)


hdfs dfsadmin –help


![020114_2115_hadoop22sin37.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin37.png?w=640)


. . .

### hadoop commands


![020114_2115_hadoop22sin38.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin38.png?w=640)


hadoop version


![020114_2115_hadoop22sin39.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin39.png?w=640)


### Web Access

The location for checking the Namenode status is at localhost: 50070/. This web page contains status information relating to the cluster.


![020114_2115_hadoop22sin40.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin40.png?w=640)


There are also links for browsing the filesystem.


![020114_2115_hadoop22sin41.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin41.png?w=640)


Logs can also be examined from the NameNode Logs link.


![020114_2115_hadoop22sin42.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin42.png?w=640)


. . .

The secondary namenode can be accessed using port 50090


![020114_2115_hadoop22sin43.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin43.png?w=640)


## On line documentation

Comprehensive documentation can be found at the Apache website or locally using a browser by pointing it at $HADOOP_INSTALL/share/doc/Hadoop/index.html/


![020114_2115_hadoop22sin44.png?w=640](http: //alanxelsys.files.wordpress.com/2014/02/020114_2115_hadoop22sin44.png?w=640)


Feedback, corrections and suggestions are welcome, as are suggestions for further HOWTOs.

 [1]: http://www.alan-johnson.net/
