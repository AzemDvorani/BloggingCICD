resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "Gigw"
  }
}
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true
}
resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public_Subnet"
  }
}
resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public_Subnet"
  }
}
resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-2a"
  tags = {
    Name = "Private_Subnet"
  }
}
resource "aws_subnet" "private_subnet_1b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-west-2b"
  tags = {
    Name = "Private_Subnet"
  }
}
resource "aws_security_group" "xemi_security_group" {
  name        = "xemi_security_group"
  description = "Security Group for RDS"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust as per your network requirements
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow outbound traffic to anywhere
  }
}

# resource "aws_security_group" "ec2_security_group" {
#   name        = "ec2_security_group"
#   description = "Security Group for EC2 instances"
#   vpc_id      = var.my_vpc.id

#   // Allow HTTPS (443) traffic from specific IP ranges
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["192.168.1.0/24", "10.0.0.0/16"] // Specify your allowed IP ranges here for HTTPS
#   }
# }


// NACLs with custom rules for different subnets.
resource "aws_network_acl" "nacl" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_network_acl_rule" "nacl_https_inbound" {
  network_acl_id = aws_network_acl.nacl.id
  rule_number    = 100
  egress         = false
  protocol       = "6" // TCP protocol
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0" // Specify your allowed IP range here for HTTPS
  from_port      = 443
  to_port        = 443
}


# resource "aws_security_group" "bastion_security_group" {
#   name        = "bastion_security_group"
#   description = "Security Group for Bastion Host"
#   vpc_id      = var.my_vpc.id

#   // Allow SSH access from your IP range
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["your_ip_range"] // Specify your allowed IP range here for SSH
#   }
# }
