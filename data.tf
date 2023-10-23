data "aws_subnet" "efs_subnet" {
  vpc_id = "vpc-0203601fa27661aa3"
  availability_zone = "ap-south-1a"
}

data "aws_eks_node_group" "qdrant-ng" {
    depends_on = [ aws_eks_node_group.qdrant-db-ng ]
  cluster_name = var.cluster_name
  node_group_name = var.qdrantDB-ng-name
}

data "aws_backup_vault" "default_backup_vault" {
  name = "Default"
}
