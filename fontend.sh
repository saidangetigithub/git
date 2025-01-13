source common.sh
component=frontend

echo "installing nginx"
dnf install nginx -y >>$log_file


echo "copy configuration files"
cp expense.conf /etc/nginx/default.d/expense.conf >>$log_file


echo "removing the default nginx content"
rm -rf /usr/share/nginx/html/* 

cd /usr/share/nginx/html

download and extract

systemctl enable nginx 

echo "starting the nginx service"
systemctl start nginx 
systemctl restart nginx 
