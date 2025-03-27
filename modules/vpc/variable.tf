variable "vpc-cidr-useast2" {
  type        = string
  description = "description"
}
variable "availability_zone" {
  type        = string
  description = "description"  
}

variable "subnet-cidr-useast2"{
    type=list(string)
    description="1-subnet"
}

variable "subnet-cidr-private-useast2"{
    type=list(string)
    description="1-subnet"
}