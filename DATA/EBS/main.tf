#This is an Elastic Block Storage module to be linked with an EC2 instance
provider "aws" {
    region = var.region
}

resource "aws_ebs_volume" "volume" {
  availability_zone = var.availability_zone
  size              = 40

  tags = {
    Name = var.tag_name_ebs
  }
}

resource "aws_ebs_snapshot" "snapshot" {
  volume_id = aws_ebs_volume.volume.id

  tags = {
    Name = var.tag_name_snapshot
  }
}

resource "aws_volume_attachment" "ebs_att" {
  count = var.attach_to_instance ? 1 : 0
  device_name = var.device_name
  volume_id   = aws_ebs_volume.volume.id
  instance_id = var.instance_id
}




