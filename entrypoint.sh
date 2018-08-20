if [ -n "${USERNAME}" ] && [ -n "${PASSWORD}" ]; then
    htpasswd -bc /etc/nginx/webdavpasswd $USERNAME $PASSWORD
fi

mkdir -p /media/.tmp
chown -R www-data /media
