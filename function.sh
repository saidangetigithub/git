download and extract() {
    echo "download $component files"
    curl -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >>$log_file
    echo "extracting the zipfiles"
    unzip /tmp/$component.zip >>$log_file
}