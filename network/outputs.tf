output "security_groups" {
  description = "Security Group details."
  value = {
    private = aws_security_group.private
    public = aws_security_group.public
  }
}

output "vpc" {
  description = "VPC details."
  value = aws_vpc.this
}

output "subnets" {
  description = "Security Group details."
  value = {
    private = aws_subnet.private
    public = aws_subnet.public
  }
}
