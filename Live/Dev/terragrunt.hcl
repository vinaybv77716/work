terraform {
  source = "../../modules/vpc"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  env             = "dev"
  vpc-cidr-useast2 = "10.0.0.0/16"
  subnet-cidr-useast2  = ["10.0.1.0/24", "10.0.2.0/24"]
  subnet-cidr-private-useast2 = ["10.0.11.0/24", "10.0.22.0/24"]
  
  public_subnet_tags = {
        "Name"        = "public-subnet"
    "Environment" = "dev"
    "Team"        = "DevOps"
  }


  private_subnet_tags = {
        "Name"        = "private-subnet"
    "Environment" = "dev"
    "Team"        = "DevOps"
  }


}
