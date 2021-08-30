resource "aws_s3_bucket" "test_bucket" {
  bucket = "${local.environment}-${local.project}"
  acl    = "private"

  tags = {
    Name        = "Landon Test Bucket for Github Actions IAC Demo..."
    Environment = local.environment
  }
}
