output "vpc_id" {
  value       = aws_vpc.vpc.id
}

output "sub_a_id" {
  value       = aws_subnet.pub-sub-a.id
}

output "sub_b_id" {
  value       = aws_subnet.pub-sub-b.id
}
