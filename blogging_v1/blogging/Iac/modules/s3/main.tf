resource "aws_backup_vault" "example" {
  name = "example_backup_vault"
  # kms_key_arn = aws_kms_key.example.arn
}

resource "aws_backup_plan" "example" {
  name = "backup_plan1"
  rule {
    rule_name         = "backup_rule"
    target_vault_name = aws_backup_vault.example.name
    schedule          = "cron(0 12 * * ? *)"
    lifecycle {
      delete_after = 14
    }
  }
  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "enabled"
    }
    resource_type = "EC2"
  }
}
