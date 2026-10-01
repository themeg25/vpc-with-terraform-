############################################
# Generate Private Key
############################################

resource "tls_private_key" "madhan_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

############################################
# AWS Key Pair
############################################

resource "aws_key_pair" "madhan_keypair" {
 key_name = "${var.project_name}-key"
  public_key = tls_private_key.madhan_key.public_key_openssh
}

############################################
# Save Private Key
############################################

resource "local_file" "private_key" {
  filename = "${var.project_name}-key.pem"
  content         = tls_private_key.madhan_key.private_key_pem
  file_permission = "0400"
}