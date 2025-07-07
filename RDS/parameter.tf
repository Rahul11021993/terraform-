# PostgreSQL Parameter Group
resource "aws_db_parameter_group" "postgres_pg" {
  name        = "postgres-db-params"
  family      = "postgres14"
  description = "Parameter group for PostgreSQL instance"

  parameter {
    name         = "max_connections"
    value        = "100"
    apply_method = "pending-reboot"
  }
}

# MySQL Parameter Group
resource "aws_db_parameter_group" "mysql_pg" {
  name        = "mysql-db-params"
  family      = "mysql8.0"
  description = "Parameter group for MySQL instance"

  parameter {
    name         = "max_connections"
    value        = "100"
    apply_method = "pending-reboot"
  }
}
