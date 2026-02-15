resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]
}

resource "aws_db_instance" "app_db" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "17.6"
  instance_class         = "db.t3.micro"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id] # ✅ FIXED
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
}
