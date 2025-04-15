# provider block here

resource "aws_iam_role" "opensearchsnapshot" {
  name               = "opensearchsnapshot-role"
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "",
        "Effect": "Allow",
        "Principal": {
          "Service": "opensearchservice.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }
EOF
}

resource "aws_iam_policy" "opensearchsnapshot" {
  name   = "opensearch-snapshot-policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*",
        "iam:PassRole"
      ],
      "Effect": "Allow",
      "Resource": ":*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_policy_to_role" {
  role       = "opensearchsnapshot-role" // Replace with your IAM role's name
  policy_arn = aws_iam_policy.opensearchsnapshot.arn
}
