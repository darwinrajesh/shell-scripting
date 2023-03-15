#!/bin/bash 

# This is a script created to launch EC2 Servers and create the associated Route53 Record 

if [ -z "$1" ]; then 
    echo -e "\e[31m Component Name is required \e[0m \t\t"
    echo -e "\t\t\t \e[32m Sample Usage is : $ bash create-ec2.sh user \e[0m"
    exit 1
fi 

COMPONENT=$1 

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=DevOps-LabImage-CentOS7" | jq '.Images[].ImageId' | sed -e 's/"//g')
echo "Ami ID is $AMI_ID "

echo -n "Launching the instance with $AMI_ID as AMI :"
aws ec2 run-instances --image-id $AMI_ID --instance-type t2.micro --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$COMPONENT}]" 