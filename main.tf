module "vpc-useast2"{
    source="./modules/vpc"
     vpc-cidr-useast2=var.vpc-cidr-useast2
        availability_zone=var.availability_zone
     subnet-cidr-useast2=var.subnet-cidr-useast2
     subnet-cidr-private-useast2=var.subnet-cidr-private-useast2
}