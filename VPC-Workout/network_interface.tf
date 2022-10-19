resource "aws_network_interface" "n-interface" {
  subnet_id       = aws_subnet.subnet1.id
  private_ips     = ["10.0.1.50"] // select an ip address range within the subnet cidr block
  security_groups = [aws_security_group.sg-1.id]
}