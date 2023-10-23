resource "aws_db_instance" "rds-postgress-db" {

  engine                = "postgres"
  engine_version        = var.postgres_version
  db_name               = var.postgresDB_name
  instance_class        = var.postgreDB_instanceClass
  identifier            = "postgress-db-instance"
  availability_zone     = "ap-south-1a"
  multi_az              = false 
  storage_type          = "gp3"
  allocated_storage     = 30
  max_allocated_storage = 80
  performance_insights_enabled = true
  monitoring_interval   = 60
  monitoring_role_arn   = var.rds_monitoringRole_arn
  port                  = 5432 
  username              = var.postgresDB_username
  backup_retention_period =  7
  final_snapshot_identifier = "PostgresDB-final-snapshot"
  performance_insights_retention_period = 7
  manage_master_user_password = true
  skip_final_snapshot  = false  // make it false for final production
}