import Skype4Py

s=Skype4Py.Skype()

if not s.Client.IsRunning:
  s.Client.Start()
  
s.Attach()

print 'FullName: %s' % s.CurrentUser.FullName

for f in s.Friends:
  print 'FullName: %s' % f.FullName
  print 'SkypeStatus: %s' % f.OnlineStatus
  
message = 'Hi from Ubuntu'
name = ls2powerd

s.SendMessage(name,message)
