<h1>Blogging Platform</h1> 

Implement a resilient, highly available infrastructure for a blogging platform, focusing on cost-effectiveness and resource optimization.

 <h1>Methodology</h1>
 
 This Assignment should be organized in the following 4 phases:
 
 Design: Prepare and confirm the design.
 Build and Deploy: Write Infrastructure as Code (IaC) and deploy using the AWS CI/CD pipeline.
 Document:
 Provide a `Readme.md` file explaining how to create the infrastructure and run the CI/CD pipeline.
 Provide an infrastructure runbook in Markdown Format detailing operational procedures.
 Demo: Prepare a small demo script on how you are going to explain your work. Provide a video recording showcasing the deployment and operation of the infrastructure.


<h1>General Requirements</h1>
1. Map out the system architecture using draw.io.
2. Generate an IAM user with the necessary permissions for this specific infrastructure.
3. Implement an AWS CI/CD pipeline for continuous update deployment.
4. Construct Terraform code that follows the AWS Well-Architected Framework, focusing on scalability, cost efficency and security. Organize terraform resources in modules.
5. Create a Bastion server to access the DB Server securely.

<h1>AWS Resources</h1>

VPC with multiple public and private subnets across different AZs for high availability, NAT Gateways for each private subnet.
- S3 (for blog content and backups)
- EC2 (t3.micro for content management system in public subnet)
- RDS (db.t3.micro for MySQL engine in private subnet)
- DynamoDB (for user comments)
- EFS (for shared media storage between instances)
- CloudWatch
- Autoscaling Group (min 1, max 2 instances)
- Load Balancer (Network Load Balancer in public subnet)
- Bastion Host (t3.micro for secure management access)

<h1>Specific Technical Requirements</h1>

 Security
- Security Group for EC2 instances allowing only specific IP ranges on HTTPS (443).
- NACLs for enhanced security measures.
- Security Group for Bastion Host with SSH access from your IP range.

 Autoscaling
- Minimum 1 instance, maximum 2, scale based on network traffic (requests per second).

 Monitoring & Log Retention
- Enable CloudWatch for application and access logs with a 1-week retention policy.

 Database Backup
- RDS MySQL to have automated backups every 12 hours, retained for 7 days.

 Bonus Requirement
- Implement AWS Lambda function to automatically snapshot EC2 instances weekly.


<h1>Getting Started</h1>

To deploy the infrastructure and set up the CI/CD pipeline, follow these steps:

Clone this repository to your local machine.

Ensure you have Terraform and AWS CLI installed and configured with appropriate access credentials.

Navigate to the terraform directory.

Run terraform init to initialize the Terraform configuration.

Run terraform apply to create the infrastructure.

Follow the prompts to confirm the changes.

Once the infrastructure is deployed, follow the instructions in the infrastructure runbook for operational procedures.

<h1>Infrastructure Runbook</h1>

Refer to the runbook.md file in this repository for operational procedures and guidelines on managing the Blogging Platform
 
