resource "aws_instance" "nginx" {
  ami          = var.ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-sub-1.id
  security_groups = ["${aws_security_group.terraform-sg.id}"]
  depends_on = [ aws_security_group.terraform-sg ]
  lifecycle {
    ignore_changes = [ security_groups,tags ] # ignore_changes, prevent_destroy, create_before_destroy

  }
  tags = {
    Name = var.ec2-tags
  }
  
  key_name = "terraform-key" # aws_key_pair.terraform-key.key_name
  user_data = file("scripts/nginx.sh")
}






# resource "aws_key_pair" "terraform-key" {
#   key_name   = "terraform-key"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdK0sAQQ6bAvSyEiQFUNwMGq7O3Yeb5welJuIA6DDTObx3cdq3YiZOUQrUIZg7iFppsUVxv0J0t/BW1APu2lRqsf0jJhnmEOMN8i2MO6NDsMjlITjYiBJ57swEztA0aw5gWKUrIQHNiy9XGN8gT+cbsn9tRlG6njvEWnnuTnqbo5FhBjne2O1tLOmin+a7ba0oyBtj6VFyYT42rKnwbfs5l2vcwv8HQyuqwn72r/+OVSIjXlbAEqomIIVNsDUT8/vz3ggRZKcbpgD+EUndew2X/9I7dKehQ/1onElpbUuv2XzjohpDBrsAOBJH741Nk5eOuvJdhP0L0ihYD1R/9SN8VbOBEx1x81BB2NUS64R4JPmEB4KroE0dMOdTpDBBwz4XLBVdGZ/AS1qUlS+c6QnyAf56v/jeSiNAaHm+9gLGNAg0w/iyFlwFtYa+LVreqLcOtkYccotRLDOpkhcEG1NayArPl66Dk5a1tReAjGZePFUmnXO2bi53snlOJ6OIQ5s= madhukerreddybadala@Madhukar-Reddys-MacBook-Pro.local"
# }