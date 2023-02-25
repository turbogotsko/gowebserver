resource "aws_iam_role" "ec2_access_s3" {
  name = "ec2_access_s3"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
  tags = {
    name = "ec2-s3-access"
  }
}

resource "aws_iam_policy" "s3_policy" {
  name        = "s3-access-policy"
  path        = "/"
  description = "My s3 policy to be used by ec2s"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.go_app_2.arn}/*", 
        "${aws_s3_bucket.go_app_2.arn}"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2_access_attach" {
  role       = aws_iam_role.ec2_access_s3.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_instance_profile" "ec2_access_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_access_s3.name
}

