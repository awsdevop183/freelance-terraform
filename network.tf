resource "aws_vpc" "prod-vpc" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = "${var.vpc-name}"
  }
  tags_all = {
    Name = "${var.vpc-name}" 
  }
}




resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.prod-vpc.id
  tags = {
    Name = "${var.vpc-name}-IGW"
  }

}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.prod-vpc.id 

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.vpc-name}-Public-RT"
  }

}


resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.prod-vpc.id 


  tags = {
    Name = "${var.vpc-name}-Private-RT"
  }

}


resource "aws_subnet" "public-subnets" {
  count = length(var.public_cidrs)    
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = element(var.public_cidrs,count.index)
  availability_zone = element(var.azs,count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc-name}-Public-sub-${count.index+1}"
  }
}

resource "aws_subnet" "private-subnets" {
  count =   length(var.private_cidrs)   
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = element(var.private_cidrs,count.index)
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc-name}-Private-sub-${count.index+1}"
  }
}


resource "aws_route_table_association" "public-subnets" {
  count = length(var.public_cidrs) 
  subnet_id      = aws_subnet.public-subnets[count.index].id
  route_table_id = aws_route_table.public-rt.id
}


resource "aws_route_table_association" "private-subnets" {
  count = length(var.private_cidrs) 
  subnet_id      = aws_subnet.private-subnets[count.index].id
  route_table_id = aws_route_table.private-rt.id
}








