# hadoop-install

Hadoop on an EC3 cluster (Rocky Linux 8)

## Description

Ansible
1. `inventory.yaml` - Ansible inventory

Hadoop
1. `hadoop-config.yaml` - Update configs across nodes
1. `hadoop-daemons.yaml` - Create hadoop daemons' users & group
1. `hadoop-destroy.yaml` - Stop and remove Hadoop
1. `hadoop-install.yaml` - Install hadoop cluster

Knox
1. `knox-install.yaml` - Create knox user and install

## Configuration

Openstack ports:
1. 9870 - NameNode Web UI
1. 8088 - ResourceManager Web UI
1. 8443 - Knox REST

## Actions

Note: `<user>` in brackets at command beginning

### Hadoop

#### Start
1. `[hdfs]$ $HADOOP_HOME/sbin/start-dfs.sh`
1. `[yarn]$ $HADOOP_HOME/sbin/start-yarn.sh`

#### Stop
1. `[hdfs]$ $HADOOP_HOME/sbin/stop-dfs.sh`
1. `[yarn]$ $HADOOP_HOME/sbin/stop-yarn.sh`

#### First time
1. `[hdfs]$ hdfs namenode -format`
1. `[hdfs]$ hadoop fs -mkdir /tmp`
1. `[hdfs]$ hadoop fs -chmod -R 1777 /tmp`

#### Adding a user
1. `[root]$ useradd <username>`
1. `[hdfs]$ hadoop fs -mkdir -p /user/<username>`
1. `[hdfs]$ hadoop fs -chown <username>:rocky /user/<username>`

### Knox

#### Sandbox - gateway
As `knox` user:
1. Edit `NAMENODE & WEBHDFS` in `knox-1.6.0/conf/topologies/sandbox.xml`
1. `ldap.sh start`
1. `knoxcli.sh create-master`
1. `gateway.sh start`


#### Sandbox - WebHDFS
1. `echo Test > test.txt`
1. `curl -ik -u guest:guest-password -X PUT 'https://31.147.203.119:8443/gateway/sandbox/webhdfs/v1/tmp/test?op=MKDIRS'`
1. `curl -ik -u guest:guest-password -X PUT 'https://31.147.203.119:8443/gateway/sandbox/webhdfs/v1/tmp/test/test.txt?op=CREATE'`
1. `curl -ik -u guest:guest-password -T test.txt -X PUT '<location from previous request>`
