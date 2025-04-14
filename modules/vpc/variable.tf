variable "env" {
  description = "values for env"
  type        = string
}
variable "vpc-cidr-useast2" {
  type        = string
  description = "description"
}


variable "subnet-cidr-useast2"{
    type=list(string)
    description="1-subnet"
}
variable "public-subnet-tags" {
  type        = map(any)
  description = "tags for public subnet"  
}

variable "subnet-cidr-private-useast2"{
    type=list(string)
    description="1-subnet"
}
variable "private-subnet-tags" {
  type        = map(any)
  description = "tags for private subnet"
  
}