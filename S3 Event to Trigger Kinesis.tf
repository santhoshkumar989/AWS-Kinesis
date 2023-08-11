resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"
  acl    = "private"
  
  event {
    event_name = "s3:ObjectCreated:*"
    lambda_function_arn = aws_lambda_function.my_lambda.arn
  }
}
