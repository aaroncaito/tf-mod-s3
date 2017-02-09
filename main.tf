resource "aws_s3_bucket" "mod" {
  count = "${var.lifecycle_enabled}"
  bucket  = "${var.bucket}"
  acl = "${var.acl}"
  lifecycle_rule {
      id = "log"
      prefix = "log/"
      enabled = true
      transition {
          days = 30
          storage_class = "STANDARD_IA"
      }
      transition {
          days = 60
          storage_class = "GLACIER"
      }
      expiration {
          days = 90
      }
  }
  versioning {
    enabled = "${var.versioning}"
  }
  tags {
    Name        = "${var.name}"
    env         = "${var.environment}"
    stack       = "${var.stack}"
    owner       = "${var.owner}"
    team        = "${var.team}"
    client_id   = "${var.client_id}"
    client_name = "${var.client_name}"
    lifetime    = "${var.lifetime}"
    prod        = "${var.prod}"
    terraform   = "true"
  }
}
resource "aws_s3_bucket" "mod" {
  count = "${1-var.lifecycle_enabled}"
  bucket  = "${var.bucket}"
  acl = "${var.acl}"
  versioning {
    enabled = "${var.versioning}"
  }
  tags {
    Name        = "${var.name}"
    env         = "${var.environment}"
    stack       = "${var.stack}"
    owner       = "${var.owner}"
    team        = "${var.team}"
    client_id   = "${var.client_id}"
    client_name = "${var.client_name}"
    lifetime    = "${var.lifetime}"
    prod        = "${var.prod}"
    terraform   = "true"
  }
}
