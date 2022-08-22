# `tf-aws-lambda-exec-wrapper`

Deploys an AWS Lambda layer containing
[`aws-lambda-secrets-wrapper-rs`](https://github.com/PsypherPunk/aws-lambda-secrets-wrapper-rs).

See that repo. for more details but fundamentally this allows the ARN of an
AWS Secrets Manager secret to be passed to an AWS Lambda, having the ARN
resolved to the actual Secret value and passed into the AWS Lambda as an
environment variable:

```hcl
module "lambda_exec_wrapper" {
  source = "github.com/psypherpunk/tf-aws-lambda-exec-wrapper"

  lambda_exec_wrapper_version = "0.2.3"
}

resource "aws_lambda_function" "this" {
  layers = [
    module.lambda_exec_wrapper.lambda_exec_wrapper_layer_arn
  ]

  environment {
    variables = {
      AWS_LAMBDA_EXEC_WRAPPER      = "/opt/secrets-wrapper"
      DATABASE_PASSWORD_SECRET_ARN = "arn:aws:secretsmanager:…:…:secret:…"  # pragma: allowlist secret
    }
  }
}
```

<!-- https://github.com/terraform-docs/terraform-docs -->
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lambda_layer_version.lambda_exec_wrapper](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_layer_version) | resource |
| [null_resource.lambda_exec_wrapper](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lambda_exec_wrapper_version"></a> [lambda\_exec\_wrapper\_version](#input\_lambda\_exec\_wrapper\_version) | Semantic version of the AWS Lambda wrapper to be included. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be included with all appropriate resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_exec_wrapper_arn"></a> [lambda\_exec\_wrapper\_arn](#output\_lambda\_exec\_wrapper\_arn) | n/a |
<!-- END_TF_DOCS -->
