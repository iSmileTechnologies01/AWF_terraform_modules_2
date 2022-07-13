output "vpc_id" {
  value = aws_vpc.vpc.id
}




output "pvt1_subnet_id" {
  value = aws_subnet.pvt_main1.id
}

output "pvt2_subnet_id" {
  value = aws_subnet.pvt_main2.id
}