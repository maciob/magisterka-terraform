resource "aws_db_instance" "db" {
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "MySQL"
  engine_version    = "8.0.31"
  instance_class    = "db.t2.micro"
  name              = "db"
  username          = var.DB_Username
  password          = var.DB_Password
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  skip_final_snapshot = true
  backup_retention_period = 0
  apply_immediately = true
  
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_subnet"
  subnet_ids = var.SUBNET_IDs
}
