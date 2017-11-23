library(mailR)

send.mail(from = "sender@blah.com",
          to = c("receiver@blah.com"),
          subject = "Subject of the email",
          html=TRUE,
          body = "<H1>test</h1><font color='red'>redtext</font>",
          smtp = list(host.name = "smtpgwint.nshs.edu", port = 25),
          authenticate = FALSE,
          send = TRUE)
