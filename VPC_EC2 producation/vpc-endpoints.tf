############################################
# SSM Endpoint
############################################

resource "aws_vpc_endpoint" "ssm" {

  vpc_id = aws_vpc.madhan_vpc.id

  service_name = "com.amazonaws.${var.aws_region}.ssm"

  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.madhan_private_subnet_1.id,
    aws_subnet.madhan_private_subnet_2.id
  ]

  security_group_ids = [
    aws_security_group.ssm_endpoint_sg.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "${var.project_name}-ssm-endpoint"
  }

}

############################################
# SSM Messages Endpoint
############################################

resource "aws_vpc_endpoint" "ssmmessages" {

  vpc_id = aws_vpc.madhan_vpc.id

  service_name = "com.amazonaws.${var.aws_region}.ssmmessages"

  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.madhan_private_subnet_1.id,
    aws_subnet.madhan_private_subnet_2.id
  ]

  security_group_ids = [
    aws_security_group.ssm_endpoint_sg.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "${var.project_name}-ssmmessages-endpoint"
  }

}

############################################
# EC2 Messages Endpoint
############################################

resource "aws_vpc_endpoint" "ec2messages" {

  vpc_id = aws_vpc.madhan_vpc.id

  service_name = "com.amazonaws.${var.aws_region}.ec2messages"

  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.madhan_private_subnet_1.id,
    aws_subnet.madhan_private_subnet_2.id
  ]

  security_group_ids = [
    aws_security_group.ssm_endpoint_sg.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "${var.project_name}-ec2messages-endpoint"
  }

}

############################################
# S3 Gateway Endpoint
############################################

resource "aws_vpc_endpoint" "s3" {

  vpc_id = aws_vpc.madhan_vpc.id

  service_name = "com.amazonaws.${var.aws_region}.s3"

  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    aws_route_table.madhan_private_rt.id
  ]

  tags = {
    Name = "${var.project_name}-s3-endpoint"
  }

}