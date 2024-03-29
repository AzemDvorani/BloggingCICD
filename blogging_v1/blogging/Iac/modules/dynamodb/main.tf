resource "aws_dynamodb_table" "Az-dynamodb" {
  name           = "Az-dynamodb"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Id" // The attribute to use as the hash (partition) key
  // Define the attribute definitions
  attribute {
    name = "Id"
    type = "N"
  }
  // Data will be encrypted at rest using the AWS owned CMK for DynamoDB.
  server_side_encryption {
    enabled = true
  }
}