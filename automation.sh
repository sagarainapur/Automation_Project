#Update packages, install apache2, enable apache2

sudo apt update -y
dpkg --get-selections | grep apache. or apache2 -v
sudo apt-get update
sudo apt-get install apache2
sudo systemctl enable apache2
sudo systemctl start apache2.service

#Create a Tar archive 

timestamp=`date +%d%m%Y-%H%M%S`
cd ~
cd /tmp/
tar -zcvf sagar-httpd-logs-${timestamp}.tar.gz /var/log/apache/

#Place the tar archive in s3 bucket

sudo apt update
sudo apt install awscli

aws s3 \
cp /tmp/sagar-httpd-logs-${timestamp}.tar.gz \
s3://upgrad-sagar/sagar-httpd-logs-${timestamp}.tar.gz
