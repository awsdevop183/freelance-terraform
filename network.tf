resource "aws_vpc" "terraformvpc" {
  cidr_block = var.vpc-cidr[0]
  enable_dns_support = true
  tags = {
    Name = "Terraform-VPC-update"
  }
}


resource "aws_subnet" "subnet-1" { # terraformvpc
  vpc_id     = aws_vpc.terraformvpc.id
  cidr_block = var.subnets["sub3-cidr"]
  tags = {
    Name = "Main"
  }
}







resource "local_file" "testfile" {
    filename = "vpc-id.txt"
    content = aws_vpc.terraformvpc.id
  
}

resource "local_file" "subnet-id" {
    filename = "subnet-id.txt"
    content = aws_subnet.subnet-1.id
  
}