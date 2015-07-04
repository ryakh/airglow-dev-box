mkdir /configs
mv /tmp/configs/* /configs

rm -rf /etc/nginx/sites-enabled/*
ln -s /configs/nginx /etc/nginx/sites-enabled/nginx

service nginx restart

cd /etc/init && wget https://raw.githubusercontent.com/puma/puma/master/tools/jungle/upstart/puma-manager.conf
cd /etc/init && wget https://raw.githubusercontent.com/puma/puma/master/tools/jungle/upstart/puma.conf
