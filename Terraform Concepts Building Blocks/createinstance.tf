resource "aws_key_pair" "levelup_key" {
  key_name = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "MyFirstInstance" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  key_name = aws_key_pair.levelup_key.key_name
}

tags = {
  name = "custom_instance"
}

provisioner "file" {
  source = "installNginx.sh"
  destination = "/tmp/installNginx.sh"
}

provisioner "remote_exec" {
  inline = [
    "chmod +x /tmp/installNginx.sh",
    "sudo sed -i -e '/s\r$//' /tmp/installNginx.sh",  #Remove the spurious CR characters
    "sudo /tmp/installNginx.sh",
  ]
}

 connection {
   host = coalesce(self.public_ip, self.private_ip)
   type = "ssh"
   user = "var.INSTANCE_USERNAME"
   private_key = file(var.PATH_TO_PRIVATE_KEY)
 }