dnf module disable mysql -y 
sudo dnf install mysql80-community-release-el9-1.noarch.rpm  -y
sudo dnf install mysql-community-server -y
systemctl enable mysqld
systemctl start mysqld  
mysql_secure_installation --set-root-pass ExpenseApp@1