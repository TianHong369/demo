call mvn clean
call mvn install
robocopy C:\Users\tianh\Downloads\maven-examples-master\java-web-project\target D:\git\apache-tomcat-9.0.71\webapps /E /MOVE
cd D:\git\apache-tomcat-9.0.71\bin
DEL /F /S /Q D:\git\apache-tomcat-9.0.71\webapps\demo
call shutdown.bat
call startup.bat
pause
