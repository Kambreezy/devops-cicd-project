provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "intro" {
  ami                    = "ami-0715c1897453cabd1"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "dev-key"
  vpc_security_group_ids = ["sg-05dd08a480eec2421"]
  tags = {
    Name    = "First Instance"
    Project = "AWS"
  }
}