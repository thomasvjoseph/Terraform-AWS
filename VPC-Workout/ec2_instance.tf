resource "aws_instance" "ec2-web" {
  ami           = "ami-062df10d14676e201" # us-west-2
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  key_name = "new-key"

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.n-interface.id  
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo bash -c 'echo your very first web server > /var/www/html/index.html'
              EOF
    tags = {
      Name = "first-ec2-server"
    }
}
output "server_private_ip" {
  value = aws_instance.ec2-web.private_ip
}

output "server_id" {
  value = aws_instance.ec2-web.id
}
