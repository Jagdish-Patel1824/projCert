# 🧠 EC2 Configuration Map
locals {
  instances = {
    master     = { role = "master" }
    slave      = { role = "test" }
    production = { role = "prod" }
  }
}

# 🚀 EC2 Instances
resource "aws_instance" "devops_ec2" {
  for_each = local.instances

  ami           = "ami-0ec10929233384c7f" # Ubuntu 22.04 (Mumbai region)
  instance_type = "t2.micro"
  key_name      = "devops-final" # 🔑 Your key pair name

  tags = {
    Name = each.key
    Role = each.value.role
  }
}