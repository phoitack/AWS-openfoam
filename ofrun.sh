#!/bin/bash
source /opt/openfoam6/etc/bashrc
source ~/.bashrc
export PATH=~/.local/bin:$PATH
date
echo "Args: $@"
#env
echo "Welcome to AWS OpenFOAM built by Indee."
echo "jobId: $AWS_BATCH_JOB_ID"
echo "jobQueue: $AWS_BATCH_JQ_NAME"
echo "computeEnvironment: $AWS_BATCH_CE_NAME"
sudo mkdir /fsx
sudo mount -t lustre -o noatime,flock fs-03f7dae7c222360f2.fsx.us-west-2.amazonaws.com@tcp:/fsx /fsx
echo "fs-03f7dae7c222360f2.fsx.us-west-2.amazonaws.com@tcp:/fsx /fsx lustre defaults, noatime,flock,_netdev 0 0" >> /etc/fstab 
cat /etc/fstab
cd /fsx
echo $PWD
df
aws s3 sync s3://indeenfsworkdir/sim18-run-batch .

decomposePar
