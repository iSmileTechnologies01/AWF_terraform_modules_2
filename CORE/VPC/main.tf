#vpc creation

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

#Created internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

#creating routetable
resource "aws_route_table" "route-private" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.igw.id
  }


}

# Create a pvt-subnets main1,main2

resource "aws_subnet" "pvt_main1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pvt1_cidr_block
  availability_zone = var.pvt1_availability_zone


}

# Create a private-subnet2
resource "aws_subnet" "pvt_main2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pvt2_cidr_block
  availability_zone = var.pvt2_availability_zone


}


#Associate subnet with route table
resource "aws_route_table_association" "route-private-main1" {
  subnet_id      = aws_subnet.pvt_main1.id
  route_table_id = aws_route_table.route-private.id
}
resource "aws_route_table_association" "route-private-main2" {
  subnet_id      = aws_subnet.pvt_main2.id
  route_table_id = aws_route_table.route-private.id
}