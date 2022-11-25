resource "aws_sns_topic" "Insuficiant_Data_CPU" {
	name		=	"Insuficiant_Data_CPU"
}
resource "aws_sns_topic_subscription" "Insuficiant_Data_CPU" {
  	topic_arn	=	aws_sns_topic.Insuficiant_Data_CPU.arn
  	protocol  	=	"email"
  	endpoint  	=	"ilija.dimitrov@rldatix.com"
}
