Set-PSDebug -Trace 1

Invoke-WebRequest -Uri "http://www.ltr-data.se/files/imdiskinst.exe" -OutFile imdiskinst.exe
.\imdiskinst.exe /fullsilent
