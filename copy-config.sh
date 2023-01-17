#!/bin/bash

# source: https://www.linode.com/docs/guides/how-to-install-and-set-up-hadoop-cluster/#configure-the-master-node

# check if HADOOP_HOME set
if [ -z $HADOOP_HOME ]
then
  echo " --- copy-config.sh: HADOOP_HOME not set, exiting"
  exit 1
fi

# config files
files=(
  hadoop-env.sh
  core-site.xml
  hdfs-site.xml
  mapred-site.xml
  yarn-site.xml
  workers
)

# copy each file
for file in ${files[@]}
do
  sudo cp $file $HADOOP_HOME/etc/hadoop/.
done

# rsync with workers
for worker in $( cat workers )
do
  sudo rsync -avzh $HADOOP_HOME/etc/hadoop/ $worker:$HADOOP_HOME/etc/hadoop/
done
