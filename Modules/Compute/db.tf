resource "aws_db_instance" "db" {
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "5.7.31"
  instance_class    = "db.t2.micro"
  name              = "db"
  username          = var.DB_Username
  password          = var.DB_Password
  db_subnet_group_name = "db_subnet"
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_subnet"
  subnet_ids = var.SUBNET_IDs
}
