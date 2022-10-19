resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.n-interface.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [
    aws_internet_gateway.i-gw
  ]
}
output "server_public_ip" {
   value = aws_eip.one.public_ip
}