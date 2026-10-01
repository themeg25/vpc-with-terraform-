# AWS Terraform - VPC with Private EC2

## Project Overview

This project provisions a secure AWS infrastructure using Terraform. It creates a custom VPC with public and private subnets, an Internet Gateway, route tables, a security group, IAM role, auto-generated SSH key pair, CloudWatch Agent, and a private EC2 instance running Amazon Linux 2023.

---

## Architecture

```
                        Internet
                            |
                    Internet Gateway
                            |
        -----------------------------------------
        |                                       |
  Public Subnet 1                        Public Subnet 2
        |                                       |
        -----------------------------------------
                     Custom VPC
        -----------------------------------------
        |                                       |
 Private Subnet 1                       Private Subnet 2
        |
  Private EC2 Instance
        |
 CloudWatch Agent
        |
 CloudWatch Logs
```

---

## Project Structure

```
VPC_EC2_PRODUCTION/
│
├── versions.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── locals.tf
├── vpc.tf
├── ami.tf
├── security-group.tf
├── iam.tf
├── keypair.tf
├── userdata.tf
├── ec2.tf
├── outputs.tf
└── README.md
```

---

## AWS Resources

- VPC
- Internet Gateway
- Public Route Table
- Private Route Table
- 2 Public Subnets
- 2 Private Subnets
- Security Group
- IAM Role
- IAM Instance Profile
- Auto Generated SSH Key Pair
- Latest Amazon Linux 2023 AMI
- Private EC2 Instance
- CloudWatch Agent

---

## Files Description

| File | Description |
|------|-------------|
| versions.tf | Terraform and Provider Version |
| provider.tf | AWS Provider Configuration |
| variables.tf | Input Variables |
| terraform.tfvars | Variable Values |
| locals.tf | Common Local Values |
| vpc.tf | VPC, Subnets, Internet Gateway and Route Tables |
| ami.tf | Latest Amazon Linux 2023 AMI |
| security-group.tf | Security Group Configuration |
| iam.tf | IAM Role and Instance Profile |
| keypair.tf | Auto Generated SSH Key Pair |
| userdata.tf | EC2 Bootstrap Script |
| ec2.tf | Private EC2 Instance |
| outputs.tf | Output Values |

---

## EC2 Configuration

| Property | Value |
|----------|-------|
| Operating System | Amazon Linux 2023 |
| Instance Type | t2.micro |
| Deployment | Private Subnet |
| Public IP | Disabled |
| IAM Role | CloudWatch Agent |
| SSH Key | Auto Generated |

---

## Security Group

### Inbound Rules

| Port | Protocol | Source |
|------|----------|--------|
| 22 | TCP | 0.0.0.0/0 |
| 80 | TCP | 0.0.0.0/0 |
| 443 | TCP | 0.0.0.0/0 |

### Outbound Rules

Allow All Traffic

---

## CloudWatch Agent

The EC2 User Data script performs the following tasks:

- Updates the operating system
- Installs Amazon CloudWatch Agent
- Configures CloudWatch Agent
- Starts CloudWatch Agent
- Sends system logs to CloudWatch Logs

Collected log files:

- `/var/log/messages`
- `/var/log/cloud-init.log`

---

## Variables

| Variable | Description |
|----------|-------------|
| aws_region | AWS Region |
| project_name | Project Name |
| environment | Environment |
| instance_type | EC2 Instance Type |
| owner | Resource Owner |

---

## Prerequisites

- AWS Account
- AWS CLI
- Terraform 1.5+
- IAM User with sufficient permissions

---

## Deployment

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Preview Changes

```bash
terraform plan
```

### Deploy Infrastructure

```bash
terraform apply
```

Type:

```
yes
```

---

## Outputs

After deployment, Terraform displays:

- EC2 Instance ID
- Private IP Address
- Generated Key Pair Name

View outputs anytime using:

```bash
terraform output
```

---

## Destroy Infrastructure

```bash
terraform destroy
```

---

## Notes

- The EC2 instance is deployed in a private subnet.
- A NAT Gateway or VPC Endpoints are recommended if the private instance requires outbound internet access.
- The private key (`<project-name>-key.pem`) is generated automatically and saved locally.
- Store the private key securely.

---

## Tags

All resources use common tags:

- Project
- Environment
- Owner
- ManagedBy

---

## Author

**Madhan Mohan**

AWS | Terraform | DevOps Engineer