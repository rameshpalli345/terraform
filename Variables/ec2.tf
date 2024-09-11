resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic and all outbound traffic"
  
  tags = {
    Name = "allow_ssh"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }
    
  }

resource "aws_instance" "Nginx" {
         ami     = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
   vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "Nginx"
  }
}