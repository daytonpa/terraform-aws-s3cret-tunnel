resource "aws_vpc" "this" {
  cidr_block       = "10.0.0.0/27"
  instance_tenancy = "default"

  tags = {
    Name = "${var.name_prefix}-privatelink-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.0.0/28"

  tags = {
    Name = "${var.name_prefix}-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.1.31/28"

  tags = {
    Name = "${var.name_prefix}-private-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name_prefix}-igw"
  }
}

# S3 VPC Endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.this.id
  service_name = "com.amazonaws.us-east-1.s3"
}
