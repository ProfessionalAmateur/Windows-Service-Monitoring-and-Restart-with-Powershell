###################################################################
# verify_service_status.ps1
# Created: 09/14/2012
# Author: Brian
# Summary: Verify a service is running, send email if it's down
###################################################################
#####################################
# Send Email Function
#####################################
 function sendMail($service, $serverNM){
  
     #SMTP server name
     $smtpServer = "XXX.XXX.XXX.XXX"
      
     #Creating a Mail object
     $msg = new-object Net.Mail.MailMessage
 
     #Creating SMTP server object
     $smtp = new-object Net.Mail.SmtpClient($smtpServer)
 
     #Email structure
     $msg.From = "Server@example.com"
     $msg.ReplyTo = "ImportantPeople@example.com"
     $msg.To.Add("ImportantPeople@example.com"
     $msg.To.Add("ImportantPeople@example.com"
     $msg.subject = 'Alert ' + $Service + ' is not running on ' + $serverNM
     $msg.body = "The following service is not running on " + $serverNM + " and has attempted to be restarted: " + $Service
 
     #Sending email
     $smtp.Send($msg)
  
}
 
##############################
# Get service status
##############################
if($args[0] -ne $NULL){
 
    $serviceName = $args[0]
    $serverName = hostname
 
    $status = (Get-Service $serviceName).Status
 
    if ($status -ne "Running"){
        sendMail "$serviceName" "$serverName"
        Restart-Service $ServiceName
    }else{
            # Service is running, do nothing;
    }
}
