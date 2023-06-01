resource "aws_iam_role" "preprod-vpc-apps" {
  name = "eks-cluster-preprod-vpc-apps"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "preprod-vpc-apps_amazon_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.preprod-vpc-apps.name
}

resource "aws_eks_cluster" "preprod-vpc-apps" {
  name     = "preprod-vpc-apps"
  version  = "1.24"
  role_arn = aws_iam_role.preprod-vpc-apps.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private_ap_southeast_1a.id,
      aws_subnet.private_ap_southeast_1b.id,
      aws_subnet.public_ap_southeast_1a.id,
      aws_subnet.public_ap_southeast_1b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.preprod-vpc-apps_amazon_eks_cluster_policy]
}
