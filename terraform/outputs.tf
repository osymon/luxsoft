output "webserver1-ip" {
  value = aws_instance.webserver[0].public_ip
}
output "webserver2-ip" {
  value = aws_instance.webserver[1].public_ip
}
output "webserver1-dns" {
  value = aws_instance.webserver[0].public_dns
}
output "webserver2-dns" {
  value = aws_instance.webserver[1].public_dns
}
