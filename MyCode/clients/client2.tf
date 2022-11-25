module "client2" {
source		=	"../modules"
name		=	"Client2"
Product		=	"OrilyInstanceWeb"
InstanceType	=	"t2.micro"
Responsible	=	"Ilija Dimitrov"
Key_Name	=	aws_key_pair.kp.id	
}
