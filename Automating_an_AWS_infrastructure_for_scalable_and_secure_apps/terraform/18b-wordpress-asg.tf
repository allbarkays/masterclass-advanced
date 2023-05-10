resource "aws_autoscaling_group" "wordpress-asg" {
  name                      = "wordpress-asg"
  max_size                  = 0
  min_size                  = 0
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 0

  vpc_zone_identifier = [
    aws_subnet.PrivateSubnet-1.id,
    aws_subnet.PrivateSubnet-2.id
  ]


  launch_template {
    id      = aws_launch_template.wordpress-launch-template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "masterclass-wordpress"
    propagate_at_launch = true
  }

}
