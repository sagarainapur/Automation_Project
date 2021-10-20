# Automation_Project
Covers following topics - Linux and Bash scripting, Networking fundamentals, DevOps - Git, Web servers and AWS services. 

Set Up Necessary Infrastructure
- create an IAM role that can be attached to an EC2 instance, and attach a policy ‘AmazonS3FullAccess’. Use the role name as ‘YourFirstName_CourseAssignment’ and     tag (key, value) as (EC2, S3Full)
- create an IAM role that can be attached to an EC2 instance, and attach a policy ‘AmazonS3FullAccess’. Use the role name as ‘YourFirstName_CourseAssignment’ and 
  tag (key, value) as (EC2, S3Full)
- create an S3 bucket with the name ‘upgrad-<YourFName>’ or anything if not available.
    

Writing a Shell Scipt
- Performed an update of the package details and the package list at the start of the script     
- Installed the apache2 package if it is not already installed. (The dpkg and apt commands are used to check the installation of the packages.)
- Ensured that the apache2 service is running.
- Ensured that the apache2 service is enabled.
- Created a tar archive of apache2 access logs and error logs that are present in the /var/log/apache2/ directory and place the tar into the /tmp/ directory.
- Created a tar of only the .log files
- Script run the AWS CLI command and copy the archive to the s3 bucket

    
Automated the Automation.sh and ensured it achieves the following
- Bookkeeping - Ensured script checks for the presence of the inventory.html file in /var/www/html/; if not found, creates it. This file will essentially serve as a web page to get the metadata of the archived logs. (Hitting ip/inventory.html will show the bookkeeping data)
- If an inventory file already exists, the content of the file should not be deleted or overwritten. New content should be only appended in a new line.
- When your script runs, it creates a new entry in the inventory.html file about the following: 

    What log type is archived?
    Date when the logs were archived 
    The type of archive
    The size of the archive

The inventory file should look like the following after multiple runs:

cat /var/www/html/inventory.html

Log Type               Date Created               Type      Size 
httpd-logs        010120201-100510         tar        10K
httpd-logs        020120201-100510         tar        40K
httpd-logs        030120201-100510        tar        4K
httpd-logs        040120201-100510        tar        6K

Hint: Ensure that your columns are tab-separated (one or more tabs).

 
- Cron Job - Script creates a cron job file in /etc/cron.d/ with the name 'automation' that runs the script /root/<git repository name>/automation.sh every day via the root user. Script should be placed in the /root/<git repository name>/ directory. (Example: If your Git repository is named ‘Automation_Project’, the cron job will then run the script present in /root/Automation_Project/automation.sh)
- Automation script will check if a cron job is scheduled or not; if not, then it should schedule a cron job by creating a cron file in the /etc/cron.d/ folder
    
    
