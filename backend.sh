source common.sh
component =backend

dnf module disable nodejs -y >>$log_file
echo $?
dnf module enable nodejs:18 -y >>$log_file
echo $?

echo "downloading nodejs"
dnf install nodejs -y >>$log_file
echo $?

echo "coping backend service file"
cp backend.service /etc/systemd/system/$component.service >>$log_file
echo $?

echo "adding user"
useradd expense >>$log_file
echo $?

mkdir /app
cd /app 

download and extract
echo $?



echo "downloading npm dependencies"
npm install >>$log_file
echo $?

echo "reloading and starting backend"
 systemctl daemon-reload >>$log_file
 echo $?
 systemctl enable backend >>$log_file
 echo $?
systemctl start backend >>$log_file
echo $?

echo "installing mysql database"
dnf install mysql -y >>$log_file
echo $?

echo "running schema"
mysql -h 172.31.7.189 -uroot -pExpenseApp@1 < /app/schema/$component.sql 
echo $?