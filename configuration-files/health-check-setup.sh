#!/bin/bash

# Set the public IP address of the primary EC2 instance
PRIMARY_INSTANCE_IP="<Primary_Instance_IP>"

# Create a Route 53 health check for the primary EC2 instance
aws route53 create-health-check \
  --caller-reference "$(date)" \
  --health-check-config '{
    "IPAddress": "'"$PRIMARY_INSTANCE_IP"'",
    "Port": 80,
    "Type": "HTTP",
    "ResourcePath": "/cafe",
    "RequestInterval": 10,
    "FailureThreshold": 2
  }'

echo "Health check setup completed for Primary Instance: $PRIMARY_INSTANCE_IP"
