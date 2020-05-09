resource "aws_iam_user" "terraform" {
  name = "terraform"
  path = "/system/"

  # tags = {
  #   tag-key = "tag-value"
  # }
}

# resource "aws_iam_access_key" "terraform-key" {
#   user = "${aws_iam_user.terraform.name}"
# }

resource "aws_iam_user_policy" "terraform-access-policy" {
  name = "test"
  user = "${aws_iam_user.terraform.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}