dnf module disable nodejs -y
dnf module enable nodejs:18 -y

echo "downloading nodejs"
dnf install nodejs -y

echo "coping backend service file"
cp backend.service /etc/systemd/system/backend.service

echo "adding user"
useradd expense

mkdir /app 

echo "downloading app content"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip 

echo "extracting zipped files"
unzip /tmp/backend.zip

cd /app

echo "downloading dependencies"
npm install

echo "reloading and starting backend"
 systemctl daemon-reload
 systemctl enable backend 
systemctl start backend

echo "installing mysql database"
dnf install mysql -y 

echo "running schema"
mysql -h 172.31.7.189 -uroot -pExpenseApp@1 < /app/schema/backend.sql 