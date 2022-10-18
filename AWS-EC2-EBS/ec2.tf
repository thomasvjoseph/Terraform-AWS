resource "aws_instance" "web-server" {
  ami           = "ami-01216e7612243e0ef"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
resource "aws_ebs_volume" "ec2_volume" {
 	availability_zone = "ap-south-1a"
 	size  =    10
    tags = {
    Name = "HelloWorld"
  }
}