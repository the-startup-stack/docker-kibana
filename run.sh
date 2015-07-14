echo "HOSTNAME: $HOSTNAME"
htpasswd -bc /etc/kibana/htpasswd ${KIBANA_USER} ${KIBANA_PASSWORD}
ln -s /etc/nginx/sites-available/kibana /etc/nginx/sites-enabled/kibana
sed -i "s/localhost:9200/es:9200/g" /opt/kibana-$KIBANA_VERSION-linux-x64/config/kibana.yml
sed -i "s/kibana:5601/$HOSTNAME:5601/g" /etc/nginx/sites-enabled/kibana
/usr/bin/supervisord -c /etc/supervisor/conf.d/kibana.conf
