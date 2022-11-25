resource "aws_cloudwatch_metric_alarm" "test" {
  	namespace                 	= 	"AWS/EC2"
  	metric_name               	= 	"CPUUtilization"
	alarm_name                      =       "Manage_EC2_CPU_Alerts-${var.name}"
        comparison_operator             =       "GreaterThanOrEqualToThreshold"
        evaluation_periods              =       "2"
	alarm_actions			= [
          					"arn:aws:sns:us-west-2:386743670652:Alarm_On_CPU",
          					"arn:aws:swf:us-west-2:386743670652:action/actions/AWS_EC2.InstanceId.Reboot/1.0",
        				]
      	alarm_description         	= 	"CPU alarts handler"
      	datapoints_to_alarm       	= 	2
      	dimensions                	= {
          					"InstanceId" = aws_instance.OrilyInstanceWeb.id
        				}
      	insufficient_data_actions 	= [
          					"arn:aws:sns:us-west-2:386743670652:Insuficiant_Data_CPU",
          					"arn:aws:swf:us-west-2:386743670652:action/actions/AWS_EC2.InstanceId.Reboot/1.0",
        				]
      	ok_actions                	= [
          					"arn:aws:sns:us-west-2:386743670652:Alarm_Recovery_CPU",
        				]
      	period                    	=	300
      	statistic                 	=	"Average"
      	threshold                 	=	80
      	treat_missing_data        	=	"breaching"
}
resource "aws_cloudwatch_metric_alarm" "notification" {
  	namespace                 	= 	"AWS/EC2"
  	metric_name               	= 	"CPUUtilization"
	alarm_name                      =       "Manage_EC2_CPU_Alerts_Notification-${var.name}"
        comparison_operator             =       "GreaterThanOrEqualToThreshold"
        evaluation_periods              =       "2"
	alarm_actions			= [
          					"arn:aws:sns:us-west-2:386743670652:Alarm_On_CPU",
        				]
      	alarm_description         	= 	"CPU alarts handler"
      	datapoints_to_alarm       	= 	2
      	dimensions                	= {
          					"InstanceId" = aws_instance.OrilyInstanceWeb.id
        				}
      	insufficient_data_actions 	= [
          					"arn:aws:sns:us-west-2:386743670652:Insuficiant_Data_CPU",
        				]
      	ok_actions                	= [
          					"arn:aws:sns:us-west-2:386743670652:Alarm_Recovery_CPU",
        				]
      	period                    	=	120
      	statistic                 	=	"Average"
      	threshold                 	=	60
      	treat_missing_data        	=	"breaching"
}
