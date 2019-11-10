#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo '<html> <h1> DSTC Warp Engineering Application </h1> <h3>Availability Zone: ' > /var/www/html/index.html
curl http://169.254.169.254/latest/meta-data/placement/availability-zone >> /var/www/html/index.html
echo '</h3> <h3>Instance Id: ' >> /var/www/html/index.html
curl http://169.254.169.254/latest/meta-data/instance-id >> /var/www/html/index.html
echo '</h3></html> ' >> /var/www/html/index.html
