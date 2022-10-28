provider "aws" {
 region = "us-east-2"
}

resource "aws_instance" "OrilyInstanceWeb" {
	ami		=	"ami-089a545a9ed9893b6"
	instance_type	=	"t2.micro"
#	security_groups	=	["sg.aws_security_group.SG_OrilyInstanceWeb.id"]
	vpc_security_group_ids = [aws_security_group.SG_OrilyInstanceWeb.id]	
#	key_name	=	"Iko"
	user_data = <<-EOF
		#!/bin/bash
		yum install -y httpd
		systemctl start httpd
		systemctl enable httpd
		sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
		sudo chmod 777 /var/www/html/
		echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
		EOF

	tags = {
        	Name    =       "OrilyInstanceWeb"
	}
}
