#!/bin/bash

# Set the variables for the EC2 instances
AMI_ID="ami-0abcdef1234567890"  # Replace this with the appropriate AMI ID
INSTANCE_TYPE="t2.micro"  # Change instance type if necessary
KEY_NAME="your-key-pair"  # Replace with your existing EC2 key pair name
SECURITY_GROUP="your-security-group"  # Replace with the security group ID

# Launch CafeInstance1 in us-west-2a
INSTANCE1_ID=$(aws ec2 run-instances \
  --image-id $AMI_ID \
  --count 1 \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP \
  --placement "AvailabilityZone=us-west-2a" \
  --query "Instances[0].InstanceId" \
  --output text)

# Get public IP for CafeInstance1
CAFÉ_INSTANCE1_IP=$(aws ec2 describe-instances \
  --instance-id $INSTANCE1_ID \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text)

echo "CafeInstance1 is running with IP: $CAFÉ_INSTANCE1_IP"

# Launch CafeInstance2 in us-west-2b
INSTANCE2_ID=$(aws ec2 run-instances \
  --image-id $AMI_ID \
  --count 1 \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP \
  --placement "AvailabilityZone=us-west-2b" \
  --query "Instances[0].InstanceId" \
  --output text)

# Get public IP for CafeInstance2
CAFÉ_INSTANCE2_IP=$(aws ec2 describe-instances \
  --instance-id $INSTANCE2_ID \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text)

echo "CafeInstance2 is running with IP: $CAFÉ_INSTANCE2_IP"

# Associate Elastic IP (optional, if you want static IPs)
# AWS will allocate an Elastic IP address and associate it with the instances if required

# Associate CafeInstance1's Elastic IP
aws ec2 associate-address --instance-id $INSTANCE1_ID --public-ip "50.112.247.40"

# Associate CafeInstance2's Elastic IP
aws ec2 associate-address --instance-id $INSTANCE2_ID --public-ip "34.214.240.61"

# Output the public IP addresses and URLs
echo "CafeInstance1 Public IP (Primary Website URL): 50.112.247.40/cafe"
echo "CafeInstance2 Public IP (Secondary Website URL): 34.214.240.61/cafe"
