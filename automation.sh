
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


#Add metadata to inventory.html file

size=$(find "sagar-httpd-logs-${timestamp}.tar.gz" -printf "%s")
echo  "httpd-log    ${timestamp}    tar    $size" >> /var/www/html/inventory.html


#Schedule a cron job

crontab -r
crontab -u root -l
sudo touch /etc/cron.d/automation
echo "40 14 * * * sh /root/Automation_Project/automation.sh" > /etc/cron.d/automation
sudo /usr/bin/crontab /etc/cron.d/automation
crontab -u root -l

