variable "vpc-id" {
  default = "vpc id"
}

variable "cluster_name" {
    default = "cluster name"
}

variable "eks_role_arn" {
    default = "eks role arn"
}

variable "subnet_ids" {
  type    = list(string)
  default = [ "subnet if 1", "subnet if 2", "subnet if 3" ]
}

variable "a-subnet_id" {
  type = list(string)
  default = [ "subnet id" ]
}

variable "postgres_version" {
  default = "15.3"
}

variable "postgresDB_name" {
  default = "postgresDB name"
}

variable "postgreDB_instanceClass" {
  default = "db.t3.micro"
}

variable "postgresDB_username" {
  default = "postgresDB_username"
}

variable "rds_monitoringRole_arn" {
  default = "role arn"
}

variable "webServer-ng-name" {
  default = "web server name"
}

variable "celeryMachinee-ng-name" {
  default = "celery-machine-ng"
}

variable "qdrantDB-ng-name" {
  default = "qdrant-db-ng"
}

variable "redis-ng-name" {
  default = "redis-ng"
}


variable "node_role_arn" {
  default = "node role arn"
}
