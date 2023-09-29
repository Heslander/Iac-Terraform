terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-03f65b8614a860c29"
  key_name = "iac-linux"
  instance_type = "t2.micro"
# user_data = <<-EOF
#                #!/bin/bash
#                cd /home/ubuntu 
#                echo "<h2> Feito com terraform </h2>" > index.html
#               nohup busybox httpd -f -p 8080 &
#               EOF
# user_data_replace_on_change = true
  
  tags = {
    Name = "terraform ansible python"
  }
}
