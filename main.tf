variable "instance_count" {

description = "Number of EC2 instances to create"
type = number
default =1

}
provider "aws" {
  region = "eu-central-1"  
}

resource "aws_instance" "example" {
  ami           = "ami-04e601abe3e1a910f" 
  instance_type = "t2.micro"
  key_name      = "KEY"
  user_data = <<-E0OT
    #!/bin/bash
    apt update -y
    apt install -y python3-pip
    pip3 install ansible
  EOT
  
  tags = {
  Name = "Ansible Controle node"
  }
}


resource "aws_instance" "managed" {
  count         = var.instance_count
  ami           = "ami-04e601abe3e1a910f" 
  instance_type = "t2.micro"
  key_name      = "KEY"
  
  tags = {
    Name = "Managed node-${count.index + 1}"

  security_groups = [aws_security_group.example.id]  # Укажите ID вашей группы безопасности
}

resource "aws_autoscaling_group" "example" {
  name_prefix                 = "example-asg-"
  launch_configuration       = aws_launch_configuration.example.name
  min_size                    = 2  # Минимальное количество экземпляров
  max_size                    = 4  # Максимальное количество экземпляров
  desired_capacity            = 3  # Желаемое количество экземпляров
  vpc_zone_identifier         = [vpc-03aea82bef27b2071]  # Укажите ID вашей подсети в VPC
  target_group_arns           = []  # Укажите ARN вашей целевой группы балансировщика
}

resource "aws_lb" "example" {
  name               = "example-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.example.id]  # Укажите ID ваших подсетей в VPC
}

resource "aws_lb_target_group" "example" {
  name     = "example-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vp.example.id  # Укажите ID вашего VPC
}

resource "aws_security_group" "example" {  
  name        = "example-sg"
  description = "Example security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "example" {
  vpc_id                  = vpc-03aea82bef27b2071aws_vpc.example.id  # Укажите ID вашего VPC
  availability_zone       = "eu-central-1"  # Укажите желаемую доступную зону
  cidr_block              = "10.0.0.0/16"  # Укаж
}
