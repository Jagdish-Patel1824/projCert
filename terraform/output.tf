output "instance_ips" {
  value = {
    for name, instance in aws_instance.devops_ec2 :
    name => instance.public_ip
  }
}