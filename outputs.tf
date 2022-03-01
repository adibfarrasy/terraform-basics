output "aws_vpc_details" {
    value = data.aws_vpc.main
}

output "instance_public_ip" {
    value = aws_instance.adib_test.public_ip
    description = "instance's public IP"
}