if [ -z "${USERNAME}" ] && [ -z "${PASSWORD}" ]; then
    USERNAME="http"
    PASSWORD="4JCJ#8r,2!TWLW^v"
fi

htpasswd -bc /etc/nginx/webdavpasswd $USERNAME $PASSWORD

mkdir -p /media/.tmp
chown -R www-data /media
