echo "========================="
echo "Provisioning VM..."
echo "========================="
set +H
sudo apt-get update
sudo apt-get install -y php5
sudo apt-get install -y php5-mysql
sudo apt-get install -y php5-pgsql
sudo apt-get install -y mysql-client
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y mysql-server
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean false"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password root"
sudo debconf-set-selections <<<  "phpmyadmin phpmyadmin/mysql/admin-pass password root"
sudo debconf-set-selections <<<  "phpmyadmin phpmyadmin/mysql/app-pass password root"
sudo debconf-set-selections <<<  "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo apt-get install -y phpmyadmin
sudo apt-get install -y postgresql
sudo su postgres -c "psql -U postgres -d postgres -c \"alter user postgres with password 'root'\""
sudo su -c "echo \"listen_addresses = '*'\" >> /etc/postgresql/9.1/main/postgresql.conf"
sudo apt-get install -y phppgadmin
sudo su -c "echo -e \"Alias /phppgadmin /usr/share/phppgadmin\n<Directory /usr/share/phppgadmin>\nDirectoryIndex index.php\nAllowOverride None\norder deny,allow\ndeny from all\n#allow from 127.0.0.0/255.0.0.0 ::1/128\nallow from all\n<IfModule mod_php5.c>\nphp_flag magic_quotes_gpc Off\nphp_flag track_vars On\n#php_value include_path .\n</IfModule>\n<IfModule !mod_php5.c>\n<IfModule mod_actions.c>\n<IfModule mod_cgi.c>\nAddType application/x-httpd-php .php\nAction application/x-httpd-php /cgi-bin/php\n</IfModule>\n<IfModule mod_cgid.c>\nAddType application/x-httpd-php .php\nAction application/x-httpd-php /cgi-bin/php\n</IfModule>\n</IfModule>\n</IfModule>\n</Directory>\" > /etc/apache2/conf.d/phppgadmin"
sudo su -c "echo '<?php \$conf[\"extra_login_security\"] = false; ?>' >> /etc/phppgadmin/config.inc.php"
sudo service apache2 restart
sudo service postgresql restart