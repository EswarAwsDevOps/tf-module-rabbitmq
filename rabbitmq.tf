resource "aws_spot_instance_request" "rabbitmq" {
  ami           = data.aws_ami.centos8.id
  instance_type = var.instance_type

  tags = {
    Name = "${var.env}-rabbitmq"
  }
}
  user_data = <<EOF
#!/bin/bash
labauto ansible
ansible-pull -i localhost, -U https://github.com/EswarAwsDevOps/roboshop-ansible roboshop.yml -e ROLE_NAME=rabbitmq -e ENV=${var.env}
EOF
}