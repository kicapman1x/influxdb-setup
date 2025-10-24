===SET UP INSTRUCTIONS===

wget https://download.influxdata.com/influxdb/releases/v2.7.12/influxdb2-2.7.12_linux_amd64.tar.gz
tar xvfz influxdb2-2.7.12_linux_amd64.tar.gz

wget https://dl.influxdata.com/influxdb/releases/influxdb2-client-2.7.5-linux-amd64.tar.gz
tar xvfz influxdb2-client-2.7.5-linux-amd64.tar.gz

go on browser: http://localhost:8086 > follow the onboarding process > last step will get the token (save it somewhere)
-- My org is admin_org 
-- bucket is admin_bucket (fyi)

influx config create --config-name DADDY --host-url http://localhost:8086 --org admin_org --token $(cat $SECRET_DIR/influxdb_token) --active

At this point, you can already use the influx-cli 

==TEST CRUD===
Below command to create a database for testing of CRUD operations in cli: 
influx bucket create -n test_crud -r 86400

Go in cli:
influx v1 shell

show databases:
show DATABASES

go into test_crud: 
use test_crud
show MEASUREMENTS (this is like table wor)
insert cpu,host=node1 value=10
^ cpu is the measurement, host is the tag, value is the field.
select * from cpu
Timestamp is auto put in when data received. However, if have historical timestamp, also can. 
drop MEASUREMENT cpu

insert cpu,host=node1 value=10
insert cpu,host=node2 value=15
insert cpu,host=node3 value=22
show SERIES 
select * from cpu where host='node2'
select * from cpu where time >= now() - 5m
select * from cpu where time >= now() - 1m
^ because its in epoch time, so we measure now - 1m, that will give the epoch timestamp a min ago. Then if the epoch is greater than, it means its added after 1 min ago. If its added 5 min ago, it'll be smaller (time marches forward lol)

===TELEGRAF===
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.36.3_linux_amd64.tar.gz
tar xf telegraf-1.36.3_linux_amd64.tar.gz