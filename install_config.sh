#! /usr/bin/bash

# script to install config and service files
# Script requires root

APACHE_VHOST_DIR="/etc/apache2/sites-available"
APACHE_VHOST_NAME="lebenslauf-martin-richter-me.conf"
APACHE_VHOST_ACTIVE="/etc/apache2/sites-enabled"

SYSTEMD_PATH="/etc/systemd/system/"
BACKEND_SERVICE="lebenslauf.service"

# copy and enable vhost configuration for apache2
cp ./config/$APACHE_VHOST_NAME $APACHE_VHOST_DIR/ && ln -s $APACHE_VHOST_DIR/$APACHE_VHOST_NAME $APACHE_VHOST_ACTIVE/ || echo "Error enabling apache Config"

# copy backend service file and install it as a service.
cp ./service/$BACKEND_SERVICE $SYSTEMD_PATH && systemctl enable $BACKEND_SERVICE && systemctl start $BACKEND_SERVICE || echo "Error Enabling Backend Service"


