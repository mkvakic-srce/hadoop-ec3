# hadoop-install

Installs & sets up hadoop on an EC3 cluster (Rocky Linux 8)

## Install

1. `hadoop-daemons.yaml` - Create hadoop daemons' users & group
1. `hadoop-install.yaml` - Install hadoop cluster

## Actions

Note: `<user>` in brackets at command beginning

### Start
1. `[hdfs]$ $HADOOP_HOME/sbin/start-dfs.sh`
1. `[yarn]$ $HADOOP_HOME/sbin/start-yarn.sh`

### Stop
1. `[hdfs]$ $HADOOP_HOME/sbin/stop-dfs.sh`
1. `[yarn]$ $HADOOP_HOME/sbin/stop-yarn.sh`

### First time
1. `[hdfs]$ hdfs namenode -format`
1. `[hdfs]$ hadoop fs -chmod -R 1777 /tmp`

### Adding a user
1. `[root]$ useradd <username>`
1. `[hdfs]$ hadoop fs -mkdir -p /user/<username>`
1. `[hdfs]$ hadoop fs -chown <username>:rocky /user/<username>`
