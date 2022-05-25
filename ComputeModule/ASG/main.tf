

resource "aws_placement_group" "test" {
  name     =  var.placementgroupname
  strategy =  var.placementgroupstrategy
}

resource "aws_launch_template" "foobar" {
  name_prefix   = var.prefix
  image_id      = var.imageid
  instance_type = var.instancetype
}

resource "aws_autoscaling_group" "bar" {
  name                      = var.asgname
  max_size                  = var.max
  min_size                  = var.min
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = var.capacity
  force_delete              = true
  placement_group           = aws_placement_group.test.id
  
  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
  
  vpc_zone_identifier       = var.subnetids

}