output "static_website" {
  value = aws_s3_bucket.website-hosting.website_endpoint
}
