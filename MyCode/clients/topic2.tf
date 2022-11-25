resource "aws_sns_topic" "Alarm_Recovery_CPU" {
	name		=	"Alarm_Recovery_CPU"
}
resource "aws_sns_topic_subscription" "Alarm_Recovery_CPU" {
  	topic_arn	=	aws_sns_topic.Alarm_Recovery_CPU.arn
  	protocol  	=	"email"
  	endpoint  	=	"ilija.dimitrov@rldatix.com"
}
