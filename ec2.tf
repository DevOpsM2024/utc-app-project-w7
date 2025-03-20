resource "aws_instance" "server1" {
  ami           = "ami-04aa00acb1165b32a"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public1.id
  # security_groups = [aws_security_group.sg-demo.name]
  vpc_security_group_ids = [aws_security_group.sg-demo.id]
  key_name      = aws_key_pair.aws_key.key_name
  user_data     = file("server.sh")
  tags ={
    Name = "utc-app-inst"
  }
}