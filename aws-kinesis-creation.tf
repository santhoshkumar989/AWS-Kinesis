resource "aws_kinesis_stream" "my_stream" {
  name             = "my-kinesis-stream"
  shard_count      = 1
}
