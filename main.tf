##Create and bootstrap webserver #lanzar
##key_name                    = "temp"
resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  #key_name                    = "temp"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  user_data                   = file("create_apache.sh")

  tags = {
    Name = "webserver"
  }
}