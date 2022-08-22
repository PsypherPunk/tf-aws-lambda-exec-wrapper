output "lambda_exec_wrapper_layer_arn" {
  description = "ARN of the AWS Lambda Layer containing the wrapper script."
  value       = aws_lambda_layer_version.lambda_exec_wrapper.arn
}
