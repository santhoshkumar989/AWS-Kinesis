provider "aws" {
  region = "us-east-1" 
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "csvtoawsingestionInfo" # Replace with your desired bucket name
  acl    = "private"               # You can adjust the ACL as needed (private, public-read, etc.)
}
