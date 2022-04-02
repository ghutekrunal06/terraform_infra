resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # key_name               = aws_key_pair.create_sshkey.key_name
  vpc_security_group_ids = ["${aws_security_group.create_sg.id}"]
  tags = {
    Name = "terraform_instance"
  }

  user_data = file("${path.module}/user_script.sh")
  #  user_data = <<-EOF  
  #  #!/bin/bash
  #  sudo yum update
  #  sudo yum install nginix
  #  echo "hello world" >/var/www/html/custom.html
  #  EOF

  #provisioner "remote-exec" {
  #  content     = "${var.msg}"
  #  destination = "/var/www/html/index.html"
  #inline = [
  #  "echo 'hello world!!!' > /var/www/html/index.html  "
  #]
  # script = "./user_script.sh"
  # connection {
  #  type        = "ssh"
  #  user        = "ec2-user"
  #  private_key = file("${path.module}/id_rsa")
  #  host        = self.public_ip
  #}



  # }

}
