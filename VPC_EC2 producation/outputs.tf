output "instance_id" {

  value = aws_instance.madhan_private_ec2.id

}

output "private_ip" {

  value = aws_instance.madhan_private_ec2.private_ip

}

output "key_name" {

  value = aws_key_pair.madhan_keypair.key_name

}