resource "aws_db_subnet_group" "education" {
  name       = "education-subnet-group"
  subnet_ids = ["subnet-0cb0f247292fad984", "subnet-00d284c54ceae512e"] # Replace with actual IDs

  tags = {
    Name = "Education DB Subnet Group"
  }
}
