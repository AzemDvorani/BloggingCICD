resource "aws_launch_configuration" "example" {
  name          = "azemi-new-launch-configuration"
  image_id      = "ami-03c07bedab170b21a"
  instance_type = "t3.micro"
  key_name      = "developlmskp"

}

// Autoscaling Group
resource "aws_autoscaling_group" "example" {
  desired_capacity     = 2 // for minimal spent resources
  max_size             = 2
  min_size             = 1
  vpc_zone_identifier  = [var.public_subnet_1a_id, var.public_subnet_1b_id]
  launch_configuration = aws_launch_configuration.example.id
  //availability_zones   = ["eu-west-2a", "eu-west-2b"]

}
