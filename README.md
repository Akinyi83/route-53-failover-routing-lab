# Amazon Route 53 Failover Routing Lab

## Overview
This repository contains the configuration files and documentation for setting up failover routing using Amazon Route 53 for a simple web application.

The lab simulates a failover routing configuration where a web application hosted on two EC2 instances (in different Availability Zones) is automatically switched to a secondary instance in case the primary instance becomes unavailable.

## Lab Setup

1. **Health Check**: Configured Route 53 health check for the primary EC2 instance to monitor its health.
2. **Failover Routing**: Set up failover routing for DNS records in Route 53 to route traffic to a secondary EC2 instance if the primary instance is unhealthy.
3. **Monitoring and Alerts**: Email notifications are sent when a health check fails.

## Files in this repository:
- `configuration-files/health-check-setup.sh`: Script for configuring the health check for the primary website.
- `configuration-files/route53-config.json`: JSON configuration for the Route 53 failover routing setup.
- `screenshots/health-check-creation.png`: Screenshot showing the health check setup.
- `screenshots/failover-test.png`: Screenshot showing the failover in action.

## How to Use:
1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/Akinyi83/route-53-failover-routing-lab.git
