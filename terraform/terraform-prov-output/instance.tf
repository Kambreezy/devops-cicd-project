resource "aws_key_pair" "dove-key" {
  key_name   = "adminkey"
  public_key = file("dovekey.pub")

}

resource "aws_instance" "dove-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = ["sg-05dd08a480eec2421"]
  tags = {
    Name    = "Dove Instance"
    Project = "AWS"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("dovekey")
    host        = self.public_ip
  }

}
output "PublicIP" {
  value = aws_instance.dove-instance.public_ip
}

output "PrivateIP" {
  value = aws_instance.dove-instance.private_ip
}