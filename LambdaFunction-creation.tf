resource "aws_lambda_function" "my_lambda" {
  function_name = "my-s3-to-kinesis-lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  filename      = "lambda.zip"
}

resource "aws_iam_role" "lambda_role" {
  name = "my-lambda-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}
