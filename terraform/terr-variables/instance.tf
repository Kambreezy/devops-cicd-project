resource "aws_instance" "prod-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "dev-key"
  vpc_security_group_ids = ["sg-05dd08a480eec2421"]
  tags = {
    Name    = "First Instance"
    Project = "AWS"
  }
}