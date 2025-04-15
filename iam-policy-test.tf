Enter file contents hereresource "aws_iam_role" "opensearchsnapshot" {
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
  name        = "opensearchsnapshot"
  description = "Policy with specific role ARN as resource"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListAllMyBuckets"
      ],
      "Effect": "Allow",
      "Resource": [
        "s3:*", // Replace with your actual role ARN
        "iam:PassRole"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_policy_to_role" {
  role       = "opensearchsnapshot-role" // Replace with your IAM role's name
  policy_arn = aws_iam_policy.opensearchsnapshot.arn
}
