# Route Table
resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_main_route_table_association" "this" {
  vpc_id         = aws_vpc.this.id
  route_table_id = aws_route_table.this.id
}

