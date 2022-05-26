


#1. create vpc
resource "aws_vpc" "hub_vpc" {
  cidr_block = var.hub-vpc-cidrblock
  tags = {
    "name" = "hub-vpc"
  }
}

#2. create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.hub_vpc.id

  tags = {
    Name = "main"
  }
}

#3. create a custom route table

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.hub_vpc.id
    route {
    cidr_block = var.route-table-cidrblock
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id             = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "hub_rt_public"
  }

}

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.hub_vpc.id
    route {
    cidr_block = var.route-table-cidrblock
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id             = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "hub_rt_private"
  }

}


#4. create a subnet
# created private subnets a,b,c
resource "aws_subnet" "private_subnet_a" {
  vpc_id     = aws_vpc.hub_vpc.id
  cidr_block = var.private-subnet-a
  availability_zone = var.zone-a
  tags = {
    Name = "hub-sn-pvta"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id     = aws_vpc.hub_vpc.id
  cidr_block = var.private-subnet-b
  availability_zone = var.zone-b
  tags = {
    Name = "hub-sn-pvtb"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id     = aws_vpc.hub_vpc.id
  cidr_block = var.private-subnet-c
  availability_zone = var.zone-c
  tags = {
    Name = "hub-sn-pvtc"
  }
}

#creating public subnets a,b,c
resource "aws_subnet" "public_subnet_a" {
  vpc_id     = aws_vpc.hub_vpc.id
  cidr_block = var.public-subnet-a
  availability_zone = var.zone-a
  tags = {
    Name = "hub-sn-puba"
  }
}
resource "aws_subnet" "public_subnet_b" {
  vpc_id     = aws_vpc.hub_vpc.id
  cidr_block = var.public-subnet-b
  availability_zone = var.zone-b
  tags = {
    Name = "hub-sn-pubb"
  }
}
resource "aws_subnet" "public_subnet_c" {
  vpc_id     = aws_vpc.hub_vpc.id
  cidr_block = var.public-subnet-a
  availability_zone = var.zone-c
  tags = {
    Name = "hub-sn-pubc"
  }
}

#5. associate subnet with route table

resource "aws_route_table_association" "rt_public_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rt_public_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rt_public_c" {
  subnet_id      = aws_subnet.public_subnet_c.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rt_private_a" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.rt_private.id
}

resource "aws_route_table_association" "rt_private_b" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.rt_private.id
}
resource "aws_route_table_association" "rt_private_c" {
  subnet_id      = aws_subnet.private_subnet_c.id
  route_table_id = aws_route_table.rt_private.id
}

#6. create security group to allow port 22,80,443

resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.hub_vpc.id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = var.ingress
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
   }
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.ingress
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.ingress
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.ingress
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_web"
  }
}

