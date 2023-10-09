# s3 bucket for terraform backend
resource "aws_s3_bucket" "backend" {
  #bucket = "walmart_bucket-${var.env}-${random_integer.backend.result}" # create variable for env and random number for naming
  bucket = "bucket-${lower(var.env)}-${random_integer.backend.result}" # this has lower function to convert upper case to lower case to comply with s3 naming convention. search in terraform string function 

  tags = {
    Name        = "My backend"
    Environment = "Dev"
  }
}

# kms key for bucket encryption
resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.backend.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# Generate a random number between 1 and 100 for bucket naming convention
resource "random_integer" "backend" {
  min = 1
  max = 100
  keepers = {
    # Generate a new integer each time there is a change in env
    Environment = var.env
  }
}