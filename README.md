# hadoop-install

Installs & sets up hadoop on an EC3 cluster.

## Setup (as root)

Deploy:
1. `ansible-playbook hadoop-playbook.yaml -i inventory.yaml`
1. `copy-config.sh`

Start:
1. `hdfs namenode -format`
1. `$HADOOP_HOME/sbin/start-dfs.sh`
1. `$HADOOP_HOME/sbin/start-yarn.sh`

Stop:
1. `$HADOOP_HOME/sbin/stop-all.sh`

## Actions

### Root

Adding a user:
1. `hdfs dfs -mkdir -p /user/rocky`
1. `hdfs dfs -chown rocky:supergroup /user/rocky`

### User

Upload books:
1. `download-books.sh`
1. `hdfs dfs -mkdir books`
1. `hdfs dfs -put books/*.txt books`
