#Code-Commit

resource "aws_codecommit_repository" "ecommercerepos" {

  repository_name = "BloggingRepos"
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
    location        = "https://git-codecommit.eu-west-2.amazonaws.com/v1/repos/ecommerceRepos"
    git_clone_depth = 1



  }
  artifacts {
    type = "NO_ARTIFACTS"
  }
  source_version = "refs/heads/master^{45e75652a6d8ab40869aed3270d6b94124114a4b}"
}



# data "aws_codecommit_repository" "repo" {
#   repository_name = var.repo_name
# }
# resource "aws_codebuild_project" "example" {
#   name         = var.codebuild_project_name
#   service_role = aws_iam_role.example.arn
#   environment {
#     compute_type = "BUILD_GENERAL1_SMALL"
#     image        = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
#     type         = "LINUX_CONTAINER"
#   }
#   source {
#     type            = "CODECOMMIT"
#     location        = data.aws_codecommit_repository.repo.clone_url_http
#     git_clone_depth = 1
#   }
#   artifacts {
#     type = "NO_ARTIFACTS"
#   }
#   source_version = "main"
# }

# resource "aws_codepipeline" "example" {
#   name = "terraform-pipeline"

#   role_arn = aws_iam_role.codepipeline_role.arn

#   artifact_store {
#     location = aws_s3_bucket.example_bucket.id
#     type     = "S3"
#   }

#   stage {
#     name = "Source"

#     action {
#       name     = "SourceAction"
#       category = "Source"
#       owner    = "AWS"
#       provider = "CodeCommit"
#       version  = "1"
#       configuration = {
#         RepositoryName = var.repo_name
#         BranchName     = "main"
#       }

#       output_artifacts = ["source_artifact"]
#     }
#   }

#   stage {
#     name = "Build"

#     action {
#       name            = "BuildAction"
#       category        = "Build"
#       owner           = "AWS"
#       provider        = "CodeBuild"
#       version         = "1"
#       input_artifacts = ["source_artifact"]
#       configuration = {
#         ProjectName = aws_codebuild_project.example.name
#       }
#     }
#   }
# }