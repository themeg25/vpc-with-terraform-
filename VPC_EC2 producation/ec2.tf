############################################
# Private EC2 Instance
############################################

resource "aws_instance" "madhan_private_ec2" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.small"

  subnet_id = aws_subnet.madhan_private_subnet_1.id

  vpc_security_group_ids = [
    aws_security_group.madhan_sg.id
  ]

  key_name = aws_key_pair.madhan_keypair.key_name

  iam_instance_profile = aws_iam_instance_profile.cloudwatch_profile.name

  associate_public_ip_address = false

  user_data = local.ec2_user_data

  tags = {
    Name = "${var.project_name}-private-ec2"
  }
}