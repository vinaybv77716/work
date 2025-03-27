module "vpc-useast1"{
    source="./modules/vpc"
     vpc-cidr-useast1=var.vpc-cidr-useast1
     subnet-cidr-useast1=var.subnet-cidr-useast1
     subnet-cidr-private-useast1=var.subnet-cidr-private-useast1
}