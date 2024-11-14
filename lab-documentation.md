# Amazon Route 53 Failover Routing Lab Documentation
Set up of the two ec2 instances in different avaialabilty zone is within the configurations files (launch-ec2-instances.sh) which host the cafe websites to which Route 53 failover will be set. The screenshot-section also contains a document that showcases the steps and results of each step when setting up rout53 incase one uses AWS console for this lab.

## Objective:
This lab demonstrates how to configure failover routing using Amazon Route 53 for a web application running on Amazon EC2 instances in different Availability Zones. The configuration ensures that if the primary web server fails, traffic is redirected to the secondary instance automatically.

## Prerequisites:
- Two Amazon EC2 instances running the LAMP stack with the café web application.
- Amazon Route 53 hosted zone set up with domain management.

## Lab Steps:

### 1. Confirming the Café Websites:
Before setting up failover, we confirm that both EC2 instances are running the café application:
- **Primary Instance**: CaféInstance1 (running in us-west-2a)- 
- **Secondary Instance**: CaféInstance2 (running in us-west-2b)- 
- Both instances are configured with a functional web server and accessible via the provided URLs.
- pri - 50.112.247.40/cafe
- sec - 34.214.240.61/cafe



### 2. Configuring the Route 53 Health Check:
We configure an Amazon Route 53 health check for the primary web server to monitor its health. If the primary web server fails, Route 53 will detect it and trigger failover routing.
Steps:
- Open the Route 53 console and create a health check for the primary instance.
- Configure health check parameters: 
  - Type: HTTP
  - Endpoint: CaféInstance1 IP address
  - Path: `/cafe`
  - Health check interval: 10 seconds
  - Failure threshold: 2

### 3. Configuring Route 53 Failover Routing:
Failover routing is configured to automatically route traffic to the secondary EC2 instance when the primary instance becomes unhealthy.
Steps:
- Create two A records in Route 53 for the domain.
- **Primary Record**: Points to CaféInstance1's IP address with a failover policy set to "Primary."
- **Secondary Record**: Points to CaféInstance2's IP address with a failover policy set to "Secondary."

### 4. Testing Failover Functionality:
To test the failover setup, I manually stop the primary EC2 instance:
- Route 53 detects the failure via the health check and begins routing traffic to the secondary EC2 instance.
- I verify this by checking the Availability Zone and server information on the café website.
-  Region/Availability Zone value now displays a different Availability Zone (for example, us-west-2b instead of us-west-2a). You are now seeing the website served from your CafeInstance2 instance.

### 5. Monitoring and Alerts:
Email alerts are configured to notify the user if the health check for the primary EC2 instance fails.

---

## Conclusion:
This lab successfully demonstrates how to configure Route 53 failover routing for high availability. By setting up health checks and routing policies, the web application can automatically fail over from a primary EC2 instance to a secondary instance in case of a failure.
