resource "aws_efs_file_system" "efs" {

  availability_zone_name = "ap-south-1a"

  encrypted = true

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  tags = {
    Name = "gptAssist-EFS"
  }
}

resource "aws_efs_mount_target" "efs_mount-target" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id = data.aws_subnet.efs_subnet.id
}

resource "aws_efs_backup_policy" "aws_efs_backup_policy" {
  file_system_id = aws_efs_file_system.efs.id

  backup_policy {
    status = "ENABLED"
  }

}
