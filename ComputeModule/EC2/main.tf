

resource "aws_instance" "foo" {
  ami           = var.ami
  instance_type = var.instance
  subnet_id = var.subnet_id
#   network_interface {
#     network_interface_id = aws_network_interface.foo.id
#     device_index         = 0
#   }

  credit_specification {
    cpu_credits = "unlimited"
  }
}