provider "aws" {
  region = "eu-central-1"  # Укажите желаемый регион AWS
}

resource "aws_instance" "example" {
  ami           = "ami-0329d3839379bfd15"  # Укажите AMI ID для вашего желаемого образа EC2
  instance_type = "t2.micro"  # Укажите желаемый тип экземпляра

  tags = {
    Name = "example-instance"
  }
}

resource "aws_launch_configuration" "example" {
  name_prefix   = "example-lc-"
  image_id      = aws_instance.example.ami
  instance_type = aws_instance.example.instance_type

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

resource "aws_security_group" "example" {  name        = "example-sg"
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