total=$(free | grep Mem | awk '{print $2}')
free=$(free | grep Mem | awk '{print $4}')

free_percentage=$(echo "$free / $total * 100" |bc -l)
echo $free_percentage
