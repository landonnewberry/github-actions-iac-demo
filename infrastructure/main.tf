resource "aws_s3_bucket" "host_bucket" {
  bucket = "${local.environment}-${local.project}"
  acl    = "public-read"

  tags = {
    Name        = "Landon Test Bucket for Github Actions IAC Demo..."
    Environment = local.environment
  }
}
