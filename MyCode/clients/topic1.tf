resource "aws_sns_topic" "Alarm_On_CPU" {
	name		=	"Alarm_On_CPU"
}
resource "aws_sns_topic_subscription" "Alarm_On_CPU" {
  	topic_arn	=	aws_sns_topic.Alarm_On_CPU.arn
  	protocol  	=	"email"
  	endpoint  	=	"ilija.dimitrov@rldatix.com"
}
