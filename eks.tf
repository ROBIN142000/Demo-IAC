resource "aws_eks_cluster" "eks_cluster" {
  name = var.cluster_name
  role_arn = var.eks_role_arn
  version = 1.28

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_node_group" "web-server-ng" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  node_group_name = var.webServer-ng-name
  node_role_arn = var.node_role_arn
  subnet_ids = var.subnet_ids

  instance_types = ["t3a.small"]

  scaling_config {
    desired_size = 1
    max_size = 8
    min_size = 1
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    "node-group" = "webServerNg"
  }

}

resource "aws_eks_node_group" "celery-machine-ng" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  node_group_name = var.celeryMachinee-ng-name
  node_role_arn = var.node_role_arn
  subnet_ids = var.subnet_ids

  instance_types = ["c4.xlarge"]

  scaling_config {
    desired_size = 1
    max_size = 8
    min_size = 1
  }

  update_config {
    max_unavailable = 1
  }  

  labels = {
    "node-group" = "celeryMachineNg"
  }

}

resource "aws_eks_node_group" "qdrant-db-ng" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  node_group_name = var.qdrantDB-ng-name
  node_role_arn = var.node_role_arn
  subnet_ids = var.a-subnet_id

  instance_types = ["t3a.medium"]

  scaling_config {
    desired_size = 1
    max_size = 8
    min_size = 1
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    "node-group" = "qdrantDbng"
  }

}

resource "aws_eks_node_group" "redis-ng" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  node_group_name = var.redis-ng-name
  node_role_arn = var.node_role_arn
  subnet_ids = var.subnet_ids

  instance_types = ["t3a.medium"]

  scaling_config {
    desired_size = 1
    max_size = 8
    min_size = 1
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    "node-group" = "redisNg"
  }

}

// efs csi driver is dependent on node so unless you have provisioned node do not add the add-on.
// also efs csi depends on the ip address, if the node does not have an ip address to give to efs
// csi driver, the add-on will get degraded. Make sure the eni has an additional ip address to give to the add-on


resource "aws_eks_addon" "efs_csi_driver" {
  cluster_name  =   var.cluster_name
  addon_name    =   "aws-efs-csi-driver"
  addon_version =   "v1.7.0-eksbuild.1" 

  depends_on = [ 
    aws_eks_cluster.eks_cluster,
    aws_eks_node_group.web-server-ng,
    aws_eks_node_group.celery-machine-ng,
    aws_eks_node_group.qdrant-db-ng,
   ]
}
