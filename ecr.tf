resource "aws_ecr_repository" "web_ecr" {
  name = "web"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "celery_ecr" {
  name = "celery"
  image_tag_mutability = "MUTABLE"
}