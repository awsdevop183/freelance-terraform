# resource "aws_vpc" "terraformvpc" {
#   cidr_block = var.vpc-cidr[0]
#   enable_dns_support = true
#   tags = {
#     Name = "Terraform-VPC-update"
#   }
# }


# resource "aws_subnet" "subnet-1" { # terraformvpc
#   vpc_id     = aws_vpc.terraformvpc.id
#   cidr_block = var.subnets["sub3-cidr"]
#   tags = {
#     Name = "Main"
#   }
# }







# resource "local_file" "testfile" {
#     filename = "vpc-id.txt"
#     content = aws_vpc.terraformvpc.id
  
# }

# resource "local_file" "subnet-id" {
#     filename = "subnet-id.txt"
#     content = aws_subnet.subnet-1.id
  
# }


# data "aws_vpc" "prod-vpc" {
#   id = "vpc-00e923728d23e93be"
# }

# data "aws_subnet" "public-2" {
#   id = "subnet-01698173c2da2f437"
# }


# resource "aws_instance" "web" {
#   ami           = "ami-0866a3c8686eaeeba"
#   instance_type = "t2.micro"
#   subnet_id = data.aws_subnet.public-2.id
#   tags = {
#     Name = "HelloWorld"
#   }
# }

resource "aws_vpc" "prod" {
  cidr_block = "10.1.0.0/16"
  tags = {
    "Name" = "Prod-Terraform"
  }
  tags_all = {
    "Name" = "Prod-Terraform"
  }
}





resource "aws_subnet" "subnet-3" {
  vpc_id = aws_vpc.prod.id  
  cidr_block = "10.1.6.0/24"
}




resource "aws_subnet" "private-2" {
  cidr_block = "10.1.1.0/24"
  vpc_id = aws_vpc.prod.id
  tags = {
    Name = "Private-2"
    CreatedBy = "Madhu"
  }
}

