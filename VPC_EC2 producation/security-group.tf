###############################################################
# Security Group for Private EC2
###############################################################

resource "aws_security_group" "madhan_sg" {

  name        = "${var.project_name}-ec2-sg"
  description = "Security Group for Private EC2"
  vpc_id      = aws_vpc.madhan_vpc.id

  ###############################################################
  # No Inbound Rules
  # EC2 is accessed only through AWS Systems Manager (SSM)
  ###############################################################

  egress {

    description = "Allow all outbound traffic"

    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "${var.project_name}-ec2-sg"
  }

}

###############################################################
# Security Group for SSM VPC Interface Endpoints
###############################################################

resource "aws_security_group" "ssm_endpoint_sg" {

  name        = "${var.project_name}-ssm-endpoint-sg"
  description = "Security Group for SSM VPC Endpoints"
  vpc_id      = aws_vpc.madhan_vpc.id

  ###############################################################
  # Allow HTTPS from EC2 Security Group
  ###############################################################

  ingress {

    description = "HTTPS from Private EC2"

    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    security_groups = [
      aws_security_group.madhan_sg.id
    ]
  }

  ###############################################################
  # Allow all outbound traffic
  ###############################################################

  egress {

    description = "Allow all outbound traffic"

    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "${var.project_name}-ssm-endpoint-sg"
  }

}