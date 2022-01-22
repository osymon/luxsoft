provider "aws" {
  region = var.region
}

resource "aws_key_pair" "server-key" {
  key_name   = "server-key"
  public_key = file("server-key.pub")
}

resource "aws_instance" "webserver" {
  count                  = 2
  ami                    = "ami-06ec8443c2a35b0ba"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.webserver.id]
  key_name               = aws_key_pair.server-key.key_name
  tags                   = merge(var.common_tags, { Name = "${var.common_tags["environment"]} web_server" })
}


#dynamic security group
resource "aws_security_group" "webserver" {
  name        = "webserversecgroupdynamic"
  description = "terraformsecgroup"

  dynamic "ingress" {
    for_each = var.allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.cidr_blocks
    }
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks_myip
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"            #all protocols
    cidr_blocks = var.cidr_blocks #all ip
  }
  tags = {
    name  = "WebServerSecGroup"
    owner = "Oleksandr Symonenko"
  }
}
