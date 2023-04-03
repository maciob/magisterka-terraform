resource "aws_db_instance" "db" {
  allocated_storage          = 20
  storage_type               = "gp2"
  engine                     = "sqlserver-ex"
  engine_version             = "15.00.4236.7.v1"
  instance_class             = "db.t3.small"
  # name                       = "mssql-db"
  username                   = var.DB_Username
  password                   = var.DB_Password
  db_subnet_group_name       = aws_db_subnet_group.db_subnet.name
  skip_final_snapshot        = true
  backup_retention_period    = 0
  apply_immediately          = true
  multi_az                   = false
  publicly_accessible        = true
  license_model              = "license-included"  
  vpc_security_group_ids     = [var.SEC_GROUP_ID]

  provisioner "local-exec" {
    command = "sqlcmd -S ${aws_db_instance.db.address} -U ${var.DB_Username} -P ${var.DB_Password} -i $(pwd)/${path.module}/scripts/menadzer.sql"
  }
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_subnet"
  subnet_ids = var.SUBNET_IDs
}
