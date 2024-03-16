#Code-Commit

variable "codebuild_project_name" {
  description = "The name of the CodeBuild project"
  type        = string
  default     = "my-codebuild-project"
}



resource "aws_codecommit_repository" "Bloggingrepos" {

  repository_name = "BloggingCICD"
  description     = "Blogging :: deploying infrastructure"
}


#Code-Build

resource "aws_codebuild_project" "Codebuildblogging" {

  name         = var.codebuild_project_name
  service_role = aws_iam_role.example.arn
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
    type         = "LINUX_CONTAINER"
  }
  source {
    type            = "CODECOMMIT"
    location        = "https://git-codecommit.eu-west-2.amazonaws.com/v1/repos/BloggingCICD"
    git_clone_depth = 1



  }
  artifacts {
    type = "NO_ARTIFACTS"
  }
  source_version = "refs/heads/master^{1cb85722f53573761241d1fa429d45f201a97725}"
}
