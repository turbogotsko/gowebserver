resource "aws_instance" "server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.ssh_key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.tf_sg.id]
  subnet_id                   = aws_subnet.tf_public.id
  iam_instance_profile        = aws_iam_instance_profile.ec2_access_profile.id

  tags = {
    "Name" = "server-${var.project_name}"
    "Type" = "type-${var.instance_type}"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Hello'"]

    connection {
      type        = "ssh"
      user        = var.ssh_user
      host        = self.public_ip
      private_key = file("../${var.ssh_key_name}.pem")
      timeout = "1m"
    }
  }

  provisioner "local-exec" {
 #   ansible-playbook -i inventory deploy.yaml -u ec2-user --tags fail --private-key "../key-for-server.pem" -v
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = false
     }
    command =  "echo ${self.public_ip} > inventory && ansible-playbook -i inventory deploy.yaml --private-key ../${var.ssh_key_name}.pem -u ${var.ssh_user}"
  }
}