
resource "aws_s3_bucket" "s3_bucket_hosting" {
  bucket = "minhquang-s3-bucket-hosting"

  tags = {
    Name  = "minhquang s3 bucket hosting"
    Owner = "minhquang"
  }
}

resource "aws_s3_object" "s3_bucket_hosting_object" {
  bucket       = aws_s3_bucket.s3_bucket_hosting.id
  key          = "index.html"
  source       = "../application/frontend/index.html"
  etag         = filemd5("../application/frontend/index.html")
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "s3_bucket_hosting_config" {
  bucket = aws_s3_bucket.s3_bucket_hosting.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}
