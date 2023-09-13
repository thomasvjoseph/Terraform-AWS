resource "aws_eip" "one" {
  domain                       = "vpc"
  network_interface         = aws_network_interface.n-interface.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [
    aws_internet_gateway.i-gw
  ]
}
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2-web.id
  allocation_id = aws_eip.one.id
}
output "server_public_ip" {
   value = aws_eip.one.public_ip
