resource "aws_db_instance" "myproject" {
  identifier             = "myproject"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "14"
  username               = "admin_qtree"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.education.name
  vpc_security_group_ids = ["sg-0b1a65a3a965b526b"]
  parameter_group_name = aws_db_parameter_group.postgres_pg.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}

resource "aws_db_instance" "qtree" {
  identifier             = "qtree"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  username               = "admin_qtree"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.education.name
  vpc_security_group_ids = ["sg-0b1a65a3a965b526b"]
  parameter_group_name = aws_db_parameter_group.mysql_pg.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}
