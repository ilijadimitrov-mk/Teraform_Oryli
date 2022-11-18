variable "name" {
	type		=	string
	description	=	"Name of the EC2 Instance"
	default		=	"default_bame_check_it"
}
variable "InstanceType" {
	type		=	string
	description	=	"Set Instance Type"
#	default		=	"t2.micro"
}
variable "Product" {
	type		=	string
	description	=	"Product Name"
}
variable "Responsible"{
	type		=	string
	description	=	"Deployer/Requester/Executioner"
}
variable "Key_Name" {}
