# hadoop-install

Installs & sets up hadoop on an EC3 cluster.

## Initial setup

Steps (ideally):
1. `ansible-playbook hadoop-playbook.yaml -i inventory.yaml`
2. `copy-config.sh`
3. As root:
  1. `hdfs namenode -format`
  2. `$HADOOP_HOME/sbin/start-dfs.sh`

