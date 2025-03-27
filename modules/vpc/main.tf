#vpc
resource "aws_vpc" "myvpc"{
    cidr_block=var.vpc-cidr-useast2
    tags={
        "Name"="myvpc"
    }
}

#   public Subnet
resource "aws_subnet" "my-subnet-public-useast2"{
    vpc_id=aws_vpc.myvpc.id
    map_public_ip_on_launch=true  
    cidr_block=var.subnet-cidr-useast2[count.index]
    count=length(var.subnet-cidr-useast2)
      availability_zone = var.availability_zone
}

#   private Subnet
resource "aws_subnet" "my-subnet-private-useast2"{
    vpc_id=aws_vpc.myvpc.id
    cidr_block=var.subnet-cidr-private-useast2[count.index]
    count=length(var.subnet-cidr-private-useast2)
      availability_zone = var.availability_zone
}

#Internet-Gateway
resource "aws_internet_gateway" "igw-useast2"{
    vpc_id=aws_vpc.myvpc.id
}

#Rout-Tabel-public
resource "aws_route_table" "rt-public-useast2" {
    vpc_id=aws_vpc.myvpc.id
    route{
        cidr_block="0.0.0.0/0"
        gateway_id=aws_internet_gateway.igw-useast2.id
    }
}

#Subnet-assocation-public
resource "aws_route_table_association" "rtas-public-useast2" {
  count = length(var.subnet-cidr-useast2)
  subnet_id=aws_subnet.my-subnet-public-useast2[count.index].id
  route_table_id=aws_route_table.rt-public-useast2.id 
}


# Create a NAT gateway with an Elastic IP for each private subnet to get internet connectivity
resource "aws_eip" "gw-useast2" {
  count         = length(var.availability_zone)
   domain           = "vpc"
}
resource "aws_nat_gateway" "gw-east" {
  count         = length(var.subnet-cidr-useast2)
  # subnet_id=element(var.subnet-cidr-useast2, count.index)
  subnet_id = aws_subnet.my-subnet-public-useast2[count.index].id
  allocation_id = aws_eip.gw-useast2[count.index].id 
  depends_on = [aws_internet_gateway.igw-useast2]
}

#Rout-Tabel-private
resource "aws_route_table" "rt-private-useast2" {
    vpc_id=aws_vpc.myvpc.id
    route{
        cidr_block="0.0.0.0/0"
        gateway_id=element(aws_nat_gateway.gw-east[*].id, 0)
                #   element(var.subnet-cidr-useast2, count.index)
    }
}

#Subnet-assocation-private
resource "aws_route_table_association" "rtas-private-useast2" {
  count = length(var.subnet-cidr-private-useast2)
subnet_id=aws_subnet.my-subnet-private-useast2[count.index].id
route_table_id=aws_route_table.rt-private-useast2.id
}