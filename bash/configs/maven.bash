alias mvnskip="mvn clean install -DskipTests -T 4"
alias mvniskip="mvn install -DskipTests -T 4"
alias mvni="mvn clean install -T 4"
alias mvnAll="mvn clean install -T 4"

alias runtarget="java -jar ./target/*-dependencies.jar"
#Assuming the log levels exist
alias runtargetlog="java -jar ./target/*-dependencies.jar --console-level DEBUG"
alias runtargetlogfile="java -jar ./target/*-dependencies.jar --console-level DEBUG --file-level DEBUG"
alias runtargetd="java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8007 -jar ./target/*-dependencies.jar --consolde-level DEBUG"
#Log Levels:
#DEBUG|INFO|WARN|ERROR|OFF, Default is WARN

alias mvnrun="mvn install -T 4 && java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8007 -jar ./target/*-dependencies.jar --console-level DEBUG"
alias mvnirun="mvn install -DskipTests -T 4 && java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8007 -jar ./target/*-dependencies.jar --console-level DEBUG"
alias mvnrebuild="mvn install -DskipTests -T 4"
alias mvnclean="mvn clean install -DskipTests -T 4"
alias mvncheck="mvn clean install -T 4"
