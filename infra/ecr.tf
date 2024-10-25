resource "aws_ecr_repository" "python_app_repo" {
  name                 = "mq-peter-python-app"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_lifecycle_policy" "lifecycle_policy" {
  repository = aws_ecr_repository.python_app_repo.name

  policy = <<POLICY
  {
    "rules": [
      {
        "rulePriority": 1,
        "description": "Expire images older than 30 days",
        "selection": {
          "tagStatus": "any",
          "countType": "sinceImagePushed",
          "countUnit": "days",
          "countNumber": 30
        },
        "action": {
          "type": "expire"
        }
      }
    ]
  }
  POLICY
}
