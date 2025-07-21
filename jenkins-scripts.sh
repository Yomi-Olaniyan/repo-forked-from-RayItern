#!/bin/bash
#!/bin/bash

sudo apt update
sudo apt install openjdk-17-jdk -y
java --version

#Maven-Installation-Link:
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.tar.gz
sudo tar xzvf apache-maven-3.9.11-bin.tar.gz  
sudo cp -r apache-maven-3.9.11 /opt 
cd /opt 
sudo apt install maven -y 
mvn --version
