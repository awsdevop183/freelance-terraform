variable "vpc-cidr" {
    type = list
}

variable "subnets" {
    type = map
    default = {
        sub1-cidr = "192.168.0.0/24",
        sub2-cidr = "192.168.1.0/24",
        sub3-cidr = "192.168.2.0/24"
    }
  
}




# it looks for terraform.tfvars