provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.preprod-vpc-apps.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.preprod-vpc-apps.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.preprod-vpc-apps.id]
      command     = "aws"
    }
  }
}
