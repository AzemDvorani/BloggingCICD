data "aws_iam_policy_document" "aws_iam_policy_document" {

  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "attach" {

  role       = aws_iam_role.example.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
resource "aws_iam_role" "example" {

  name               = "${var.codebuild_project_name}-service-role"
  assume_role_policy = data.aws_iam_policy_document.aws_iam_policy_document.json
}