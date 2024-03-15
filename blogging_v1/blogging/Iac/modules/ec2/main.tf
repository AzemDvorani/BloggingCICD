
resource "aws_instance" "bastion" {
  depends_on    = [aws_autoscaling_group.example]
  ami           = "ami-03c07bedab170b21a"
  instance_type = "t3.micro"
  key_name      = "developlmskp" # Replace with your key pair name
  subnet_id     = var.public_subnet_1a_id

  vpc_security_group_ids = [var.security_group_ids]
}

// EC2 Instance
resource "aws_instance" "ec2_instance" {
  ami           = "ami-03c07bedab170b21a" // Replace with your EC2 AMI ID
  instance_type = "t3.micro"
  key_name      = "developlmskp"          // Replace with your SSH key pair name
  subnet_id     = var.public_subnet_1b_id // Place the EC2 instance in the public subnet

  # security_groups = [aws_security_group.ec2_security_group.name]

  tags = {
    Name = "EC2 Instance"
  }
}

# // Bastion Host
# resource "aws_instance" "bastion" {
#   # depends_on    = [aws_autoscaling_group.example]
#   ami           = "ami-0f403e3180720dd7e" // Replace with your Bastion Host AMI ID
#   instance_type = "t3.micro"
#   key_name      = "developlmskp"          // Replace with your SSH key pair name
#   subnet_id     = var.public_subnet_1a.id // Place the bastion host in the public subnet

#   security_groups = [aws_security_group.bastion_security_group.name]

#   tags = {
#     Name = "Bastion Host"
#   }
# }

