resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  key_name      = var.key_name
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]

}

resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id
}

