############################################
# EC2 User Data
############################################

locals {

  ec2_user_data = <<-EOF
#!/bin/bash
set -eux

# Update packages
dnf update -y

# Ensure SSM Agent is installed
dnf install -y amazon-ssm-agent

# Enable and start SSM Agent
systemctl enable amazon-ssm-agent
systemctl restart amazon-ssm-agent

# Verify SSM Agent
systemctl status amazon-ssm-agent --no-pager

EOF

}