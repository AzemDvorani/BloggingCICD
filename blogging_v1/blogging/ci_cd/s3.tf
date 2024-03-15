resource "aws_s3_bucket_versioning" "Blogging" {
  bucket = "azemii"

  versioning_configuration {
    status = "Enabled"
  }
}