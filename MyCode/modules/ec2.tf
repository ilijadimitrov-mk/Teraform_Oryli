resource "aws_instance" "OrilyInstanceWeb" {
	ami		=	data.aws_ami.LinuxAMI.id
	instance_type	=	var.InstanceType
#	security_groups	=	["sg.aws_security_group.SG_OrilyInstanceWeb.id"]
	vpc_security_group_ids = [aws_security_group.SG_OrilyInstanceWeb.id]	
#	key_name	=	aws_key_pair.kp.id
	key_name	=	var.Key_Name
	user_data = <<-EOF
		#!/bin/bash
		yum install -y httpd
		sudo service httpd start
		sudo chkconfig httpd on
		#service httpd enable
		sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
		sudo chmod 777 /var/www/html/
		echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
		EOF

	tags = {
        	Name		=	var.name
		Product		=	var.Product
		Responsible	=	var.Responsible
	}
	lifecycle {
		ignore_changes = [
			ami,
			user_data,
		]
	}

}
