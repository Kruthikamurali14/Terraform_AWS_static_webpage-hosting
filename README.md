<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.website-hosting](https://registry.terraform.io/providers/hashicorp/aws/5.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.public_read_policy](https://registry.terraform.io/providers/hashicorp/aws/5.0/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.public_access](https://registry.terraform.io/providers/hashicorp/aws/5.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_website_configuration.website](https://registry.terraform.io/providers/hashicorp/aws/5.0/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_s3_object.error](https://registry.terraform.io/providers/hashicorp/aws/5.0/docs/resources/s3_object) | resource |
| [aws_s3_object.index](https://registry.terraform.io/providers/hashicorp/aws/5.0/docs/resources/s3_object) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_static_website"></a> [static\_website](#output\_static\_website) | n/a |
<!-- END_TF_DOCS -->