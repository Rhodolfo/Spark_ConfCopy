#!/bin/bash

input="dfs.include"

while IFS= read -r host
do
	echo $host
	scp -P 22 env/.bashrc  black@$host:~/.bashrc
	scp -P 22 spark/*      black@$host:/usr/local/spark/conf/
	scp -P 22 hadoop/*     black@$host:/usr/local/hadoop/etc/hadoop/
	scp -P 22 dfs.include  black@$host:/app/hadoop/dfs.include
done < $input
