resource "aws_security_group" "prod-sg" {
  name   = var.sg-name
  vpc_id = aws_vpc.prod-vpc.id
  tags_all = {
    Name = "Prod-sg"
  }
  ingress = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      description      = ""
      ipv6_cidr_blocks = []
      from_port        = 80
      to_port          = 80
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      description      = ""
      ipv6_cidr_blocks = []
      from_port        = 443
      to_port          = 443
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      description      = ""
      ipv6_cidr_blocks = []
      from_port        = 22
      to_port          = 22
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      description      = ""
      ipv6_cidr_blocks = []
      from_port        = 25
      to_port          = 25
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
    },
    {
      cidr_blocks = ["0.0.0.0/0"] 
      description      = ""
      ipv6_cidr_blocks = []
      from_port        = 8090
      to_port          = 8090
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
    },
  ]
  egress = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      description      = ""
      ipv6_cidr_blocks = []
      from_port        = 0
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  tags = {
    Name = "${var.vpc-name}-sg"
  }
}