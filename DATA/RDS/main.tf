locals {
  create_db_subnet_group = var.create_db_subnet_group
  db_subnet_group_name    = var.create_db_subnet_group ? var.db_subnet_group_name : null

  create_db_parameter_group = var.create_db_parameter_group
  parameter_group_name_id = var.create_db_parameter_group ? var.parameter_group_name : null

  create_db_option_group = var.create_db_option_group && var.db_engine != "postgres"
  option_group           = var.create_db_option_group ? var.option_group_name : null
}

resource "aws_db_subnet_group" "this" {
  count = local.create_db_subnet_group ? 1 : 0

  name        = local.db_subnet_group_name
  description = var.description
  subnet_ids  = var.subnet_ids

  tags = merge(
    var.db_subnet_tags,
    {
      "Name" = local.db_subnet_group_name
    },
  )
}

resource "aws_db_parameter_group" "this" {
  count = var.create_db_parameter_group ? 1 : 0

  name        = coalesce(var.parameter_group_name, var.identifier)
  description = var.parameter_group_description
  family      = var.family

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }

  tags = merge(
    var.parameter_gr_tags,
    {
      "Name" = var.parameter_group_name
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_option_group" "this" {
  count = var.create_db_option_group ? 1 : 0

  name                     = local.option_group
  name_prefix              = local.option_group
  option_group_description = var.option_group_description
  engine_name              = var.db_engine
  major_engine_version     = var.db_engine_version

  dynamic "option" {
    for_each = var.options
    content {
      option_name                    = option.value.option_name
      port                           = lookup(option.value, "port", null)
      version                        = lookup(option.value, "version", null)
      db_security_group_memberships  = lookup(option.value, "db_security_group_memberships", null)
      vpc_security_group_memberships = lookup(option.value, "vpc_security_group_memberships", null)

      dynamic "option_settings" {
        for_each = lookup(option.value, "option_settings", [])
        content {
          name  = lookup(option_settings.value, "name", null)
          value = lookup(option_settings.value, "value", null)
        }
      }
    }
  }

  tags = merge(
    var.option_group_tags,
    {
      "Name" = var.option_group_name
    },
  )

  timeouts {
    delete = lookup(var.timeouts, "delete", null)
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_instance" "this" {

  identifier = var.identifier
  allocated_storage    = var.allocated_storage
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = var.db_user
  password             = var.db_password
  parameter_group_name = local.parameter_group_name_id
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = local.db_subnet_group_name
  option_group_name      = local.option_group
  availability_zone   = var.availability_zone
  skip_final_snapshot = true
}



