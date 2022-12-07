resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "Wk20Project VPC"
  }

}
resource "aws_subnet" "publicSubnets" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.Availability_Zones, count.index)
  tags = {
    name = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.Availability_Zones, count.index)
  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Wk20Project"
  }
}
#Creates an AWS database 
resource "aws_db_instance" "default" {
  allocated_storage    = 20
  db_name              = "wk20tfdb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "bobbyuncle"
  password             = "smithfield_22#"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}