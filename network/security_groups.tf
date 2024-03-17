resource "aws_security_group" "private" {
  vpc_id = aws_vpc.this.id
  name = "${var.name_prefix}-private-sg"
  description = "Security Group for managing access from forwarders within Public Subnets."
  tags = {
    Name = "${var.name_prefix}-private-sg"
  }
}

resource "aws_security_group_rule" "private_ingress" {
  type = "ingress"
  description = "Access from Public instance."
  protocol = "-1"
  from_port = 0
  to_port = 0
  source_security_group_id = aws_security_group.public.id

  security_group_id = aws_security_group.private.id
}

resource "aws_security_group_rule" "private_egress" {
  type = "egress"
  description = "S3 VPC Endpoint"
  protocol = "tcp"
  from_port = 0
  to_port = 0
  prefix_list_ids = [aws_vpc_endpoint.s3.prefix_list_id]
  
  security_group_id = aws_security_group.private.id
}

resource "aws_security_group" "public" {
  vpc_id = aws_vpc.this.id
  name = "${var.name_prefix}-public-sg"
  description = "Security Group for managing access from forwarders within Public Subnets."
  tags = {
    Name = "${var.name_prefix}-public-sg"
  }
}

resource "aws_security_group_rule" "public_ingress" {
  type = "ingress"
  protocol = "-1"
  from_port = 0
  to_port = 0
  cidr_blocks = [local.my_pi_to_cidr]

  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "public_egress" {
  type = "egress"
  description = "S"
  protocol = "tcp"
  from_port = 0
  to_port = 0
  source_security_group_id = [aws_vpc_endpoint.s3.prefix_list_id]
  
  security_group_id = aws_security_group.public.id
}
