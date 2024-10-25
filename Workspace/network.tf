resource "aws_vpc" "terraform-vpc" {
    cidr_block = var.vpc-cidr

    tags = {
      Name = "${var.vpc-name}-Dev"
    }
    tags_all = {
      Name = "${var.vpc-name}-Dev"     #Terraform-vpc-Dev"
    }
}




resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.terraform-vpc.id
    tags = {
        Name = "${var.vpc-name}-IGW"
    }
  
}

resource "aws_route_table" "terraform-public-rt" {
  vpc_id = aws_vpc.terraform-vpc.id    # Implicit dependency 

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.vpc-name}-Public-RT"
  }

  }


  resource "aws_route_table" "terraform-private-rt" {
  vpc_id = aws_vpc.terraform-vpc.id    # Implicit dependency 


  tags = {
    Name = "${var.vpc-name}-Private-RT"
  }

  }


  resource "aws_subnet" "public-sub-1" {
  vpc_id     = aws_vpc.terraform-vpc.id
  cidr_block = var.pub-sub-1
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc-name}-Public-sub-1"
  }
}

  resource "aws_subnet" "private-sub-1" {
  vpc_id     = aws_vpc.terraform-vpc.id
  cidr_block = var.private-sub-1

  tags = {
    Name = "${var.vpc-name}-Private-sub-1"
  }
}


resource "aws_route_table_association" "pub-sub-1" {
  subnet_id      = aws_subnet.public-sub-1.id
  route_table_id = aws_route_table.terraform-public-rt.id 
}








resource "aws_security_group" "terraform-sg" {
  name   = "terraform-sg"
  vpc_id = aws_vpc.terraform-vpc.id
  ingress = [
        {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        description = ""
        ipv6_cidr_blocks = []
        from_port = 80
        to_port = 80
        prefix_list_ids = []
        protocol = "tcp"
        security_groups = []
        self = false
        },
        {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        description = ""
        ipv6_cidr_blocks = []
        from_port = 22
        to_port = 22
        prefix_list_ids = []
        protocol = "tcp"
        security_groups = []
        self = false
        }
    ]
  egress = [
        {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        description = ""
        ipv6_cidr_blocks = []
        from_port = 0
        prefix_list_ids = []
        protocol = "-1"
        security_groups = []
        self = false
        to_port = 0
        }
    ]
  tags = {
    Name = "${var.vpc-name}-sg"
  }
}