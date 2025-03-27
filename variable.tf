variable "vpc-cidr-useast1" {
  type        = string
  description = "description"
}

variable "subnet-cidr-useast1"{
    type=list(string)
    description="1-subnet"
}

variable "subnet-cidr-private-useast1"{
    type=list(string)
    description="1-subnet"
}