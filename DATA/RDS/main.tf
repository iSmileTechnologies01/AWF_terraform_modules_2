resource "aws_db_instance" "this" {

  identifier = var.identifier
  allocated_storage    = var.allocated_storage
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = var.db_user
  password             = var.db_password
  vpc_security_group_ids = var.vpc_security_group_ids
  availability_zone   = var.availability_zone
  skip_final_snapshot = true
}



