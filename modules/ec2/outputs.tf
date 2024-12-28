output "instance_id" {
  value = aws_instance.dify.id
}

output "public_ip" {
  value = aws_instance.dify.public_ip
}