log_file= "/tmp/expense.logs"
component= "frontend"

echo "installing nginx"
dnf install nginx -y >> $log_file


echo "copy configuration files"
cp expense.conf /etc/nginx/default.d/expense.conf >> $log_file


echo "removing the default nginx content"
rm -rf /usr/share/nginx/html/* 

curl -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >> $log_file

cd /usr/share/nginx/html

echo "extracting the zipfiles"
unzip /tmp/$component.zip >> $log_file

systemctl enable nginx 

echo "starting the nginx service"
systemctl start nginx 
systemctl restart nginx 
