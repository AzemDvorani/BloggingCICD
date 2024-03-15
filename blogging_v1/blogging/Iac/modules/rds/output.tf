# output "rds_endpoint" {
#   value = aws_db_instance.rds.endpoint
# }

# output "security_group_ids" {
#   value = module.vpc.security_group_ids
# }

output "rds_cluster_id" {
  value = aws_rds_cluster.default.id
}
