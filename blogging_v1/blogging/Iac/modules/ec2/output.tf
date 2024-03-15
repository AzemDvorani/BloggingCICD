output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

# ec2_security_group     = module.vpc.ec2_security_group
# bastion_security_group = module.vpc.bastion_security_group