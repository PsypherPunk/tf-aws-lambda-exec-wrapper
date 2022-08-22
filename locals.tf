locals {
  tags = merge(var.tags, {
    Package = "Lambda Exec Wrapper"
  })

  lambda_exec_wrapper = {
    url   = "https://github.com/PsypherPunk/aws-lambda-secrets-wrapper-rs/releases/download/${var.lambda_exec_wrapper_version}/aws-lambda-secrets-wrapper-${var.lambda_exec_wrapper_version}.zip"
    local = "${path.module}/aws-lambda-secrets-wrapper-${var.lambda_exec_wrapper_version}.zip"
  }
}
