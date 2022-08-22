resource "aws_lambda_layer_version" "lambda_exec_wrapper" {
  filename            = local.lambda_exec_wrapper.local
  layer_name          = "lambda_exec_wrapper"
  compatible_runtimes = ["python3.9"]
}

resource "null_resource" "lambda_exec_wrapper" {
  triggers = {
    "run_every_time" = uuid()
  }

  provisioner "local-exec" {
    environment = {}

    command = <<EOF
        curl "${local.lambda_exec_wrapper.url}" \
            --location \
            --output "${local.lambda_exec_wrapper.local}"
    EOF
  }
}
