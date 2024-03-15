
resource "aws_db_subnet_group" "default" {
  name       = "rds-subnet-group"
  subnet_ids = [var.private_subnet_1a_id, var.private_subnet_1b_id]
}
resource "aws_rds_cluster" "default" {
  cluster_identifier      = "default"
  engine                  = "aurora-mysql"
  engine_version          = "5.7"
  availability_zones      = ["eu-west-2a", "eu-west-2b"]
  database_name           = "mydb"
  master_username         = "foo"
  master_password         = "bararararar"
  backup_retention_period = 7
  preferred_backup_window = "07:00-09:00"
  # final_snapshot_identifier = "my-final-snapshot"
  skip_final_snapshot = "true"
  # vpc_security_group_ids  = [var.security_group_ids]
}

resource "aws_rds_cluster_instance" "xemi_instance" {
  identifier          = "xemi-instance"
  cluster_identifier  = aws_rds_cluster.default.id
  instance_class      = "db.t2.small" # Replace with your desired instance type
  engine              = aws_rds_cluster.default.engine
  engine_version      = aws_rds_cluster.default.engine_version
  publicly_accessible = false

}
