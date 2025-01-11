
dnf install nginx -y >> /tmp/expense.logs


echo "copy configuration files"
cp expense.conf /etc/nginx/default.d/expense.conf >> /tmp/expense.logs



rm -rf /usr/share/nginx/html/* 

curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >> /tmp/expense.logs

cd /usr/share/nginx/html
 
unzip /tmp/frontend.zip >> /tmp/expense.logs
systemctl enable nginx 
systemctl start nginx 
systemctl restart nginx 
