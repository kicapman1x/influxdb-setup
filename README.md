SET UP INSTRUCTIONS

wget https://download.influxdata.com/influxdb/releases/v2.7.12/influxdb2-2.7.12_linux_amd64.tar.gz
tar xvfz influxdb2-2.7.12_linux_amd64.tar.gz

wget https://dl.influxdata.com/influxdb/releases/influxdb2-client-2.7.5-linux-amd64.tar.gz
tar xvfz influxdb2-client-2.7.5-linux-amd64.tar.gz

go on browser: http://localhost:8086 > follow the onboarding process > last step will get the token (save it somewhere)
-- My org is admin_org 
-- bucket is admin_bucket (fyi)

influx config create --config-name DADDY --host-url http://localhost:8086 --org admin_org --token $(cat $SECRET_DIR/influxdb_token) --active

At this point, you can already use the influx-cli 