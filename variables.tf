variable "lambda_exec_wrapper_version" {
  description = "Semantic version of the AWS Lambda wrapper to be included."
  type        = string
}

variable "tags" {
  description = "Tags to be included with all appropriate resources."
  type        = map(string)
  default     = {}
}
