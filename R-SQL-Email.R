#Created by:      Nadeem Ramjan
#Creation date:   March 14, 2016
#Program:         
#Program Contact: 
#Purpose:         
#Impact:          
#Preconditions:   

#Step 1 - get query from the SQL file
queryString <- paste(readLines("c:\\MyQuery.sql"), collapse=" ")

#Step 2 - ODBC Connection 
odbcChannel <- odbcConnect("CareTool")

#Step 3 - Set Working Directory for the file to be placed
setwd("C:/temp")

#Step 4 - setup filename
filename <- paste("EnterFileNameHere_", Sys.Date(),".csv",sep="")

#Step 5 - Email Recipients
toEmail <- c('recipient@domain.com','recipient2@domain.com')

#Step 6 - Email From
fromEmail <- "sender@domain.com"

#Step 7 - CC Email (set variable to '' if not needed)
ccEmail <- c("cc@domain.com", "cc2@domain.com","cc3@domain.com") 

#Step 9 - BCC Email (set variable to '' if not needed)
bccEmail <- c("bcc@domain.com", "bcc2@domain.com","bcc3@domain.com") 

#Step 10 - Subject of Email
emailSubject <- "Subject Header: Subject Detail"

#Step 11 - Body of Email
bodytext <- c(   "Good Morning Sandy,"
                 ,"\nAttached, please find a refreshed list of members that need to be called this month. As per our training, please ensure that you call the members from top to the bottom.  Please let me know if you have any concerns.  You will receive a new list tomorrow so kindly discard this list at the end of the day."
                 ,"\nGood luck and have a great day!"
                 ,"John Smith"
                 ,"\n\nThe information contained in this electronic e-mail transmission and any attachments are intended only for the use of the individual or entity to whom or to which it is addressed, and may contain information that is privileged, confidential and exempt from disclosure under applicable law. If the reader of this communication is not the intended recipient, or the employee or agent responsible for delivering this communication to the intended recipient, you are hereby notified that any dissemination, distribution, copying or disclosure of this communication and any attachment is strictly prohibited. If you have received this transmission in error, please notify the sender immediately by telephone and electronic mail, and delete the original communication and any attachment from any computer, server or other electronic recording or storage device or medium. Receipt by anyone other than the intended recipient is not a waiver of any attorney-client, physician-patient or other privilege."
)

#------DO NOT EDIT ANYTHING BELOW THIS LINE--------
#Code to execute the query and send email based on the variables set below 
library(RODBC)
library(sendmailR)
DataSet <- sqlQuery(odbcChannel,queryString)
odbcClose(odbcChannel)
write.csv(DataSet,file=filename)
from <- fromEmail
to <- toEmail
cc <- ccEmail
bcc <- bccEmail
subject <- emailSubject
body <- bodytext
mailControl=list(smtpServer="smtpserver.domain.com")
attachmentPath <- filename
attachmentName <- filename
attachmentObject <- mime_part(x=attachmentPath,name=attachmentName)
bodyWithAttachment <- list(body,attachmentObject)
sendmail(from=from,to=to,cc=cc,bcc=bcc,subject=subject,msg=bodyWithAttachment,control=mailControl)
