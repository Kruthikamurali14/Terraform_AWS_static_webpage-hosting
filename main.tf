terraform {
  required_version = "~> 1.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
}


resource "aws_s3_bucket" "website-hosting" {
  bucket = "my-bucket-${random_string.random.result}"

  tags = {
    Name        = "My bucket"
    Environment = "dev"
  }
}

resource "aws_s3_object" "index" {
  key          = "index.html"
  bucket       = aws_s3_bucket.website-hosting.id
  source       = "index.html"
  content_type = "text/html" # Ensure it's rendered as an HTML file


}

resource "aws_s3_object" "error" {
  key          = "error.html"
  bucket       = aws_s3_bucket.website-hosting.id
  source       = "error.html"
  content_type = "text/html" # Ensure it's rendered as an HTML file

}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.website-hosting.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website-hosting.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "public_read_policy" {
  bucket = aws_s3_bucket.website-hosting.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = ["${aws_s3_bucket.website-hosting.arn}/*"]
      }
    ]
  })
}



