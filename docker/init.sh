#!bin/bash

if [ -d "/home/frappe/frappe-bench/apps/frappe" ]; then
    echo "Bench already exists, skipping init"
    cd frappe-bench
    bench start
else
    echo "Creating new bench..."
fi

export PATH="${NVM_DIR}/versions/node/v${NODE_VERSION_DEVELOP}/bin/:${PATH}"

bench init --skip-redis-config-generation frappe-bench

cd frappe-bench

# Use containers instead of localhost
bench set-mariadb-host mariadb
bench set-redis-cache-host redis://redis:6379
bench set-redis-queue-host redis://redis:6379
bench set-redis-socketio-host redis://redis:6379

# Remove redis, watch from Procfile
sed -i '/redis/d' ./Procfile
sed -i '/watch/d' ./Procfile

bench get-app erpnext
bench get-app edunex

bench new-site edunex.localhost \
--force \
--mariadb-root-password 123 \
--admin-password admin \
--no-mariadb-socket

bench --site edunex.localhost install-app erpnext
bench --site edunex.localhost install-app edunex
bench --site edunex.localhost set-config developer_mode 1
bench --site edunex.localhost enable-scheduler
bench --site edunex.localhost clear-cache
bench use edunex.localhost

bench start