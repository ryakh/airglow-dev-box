mkdir /configs
mv /tmp/configs/* /configs

rm -rf /etc/nginx/sites-enabled/*
ln -s /configs/nginx /etc/nginx/sites-enabled/nginx

service nginx restart
