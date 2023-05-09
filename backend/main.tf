# S3 bucket
resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket_name
    tags = {
        Name = "TerraformState"
    }
}

#dynamodb_table
resource "aws_dynamodb_table" "terraform-lock" {
    name           = var.dynamodbTable_name
    read_capacity  = 2
    write_capacity = 2
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "TerraformStateLockTable"
    }
}