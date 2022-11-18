module "client3" {
source		=	"../modules"
name		=	"Client3"
Product		=	"OrilyInstanceWeb"
InstanceType	=	"t2.micro"
Responsible	=	"Ilija Dimitrov"
Key_Name	=	aws_key_pair.kp.id
}
