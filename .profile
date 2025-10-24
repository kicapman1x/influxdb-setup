export INFLUX_HOME='/home/daddy/apps/influxdb/influxdb2-2.7.12'
export TELEGRAF_HOME='/home/daddy/apps/influxdb/telegraf-1.36.3'
export INFDB_ADMIN_USER=$(grep 'user' $SECRETS_DIR/influxdb_cred | cut -d'=' -f2)
export INFDB_ADMIN_PW=$(grep 'password' $SECRETS_DIR/influxdb_cred | cut -d'=' -f2)
export INFDB_ADMIN_TOKEN=$(cat $SECRETS_DIR/influxdb_token)

alias startinfdb='nohup $INFLUX_HOME/usr/bin/influxd > $INFLUX_HOME/logs/influxd.log &'
alias stopinfdb='kill -15 $(pgrep influxd)'
alias influx='$INFLUX_HOME/usr/bin/influx'
alias starttg='nohup $TELEGRAF_HOME/usr/bin/telegraf --config $TELEGRAF_HOME/etc/telegraf/telegraf.conf > $INFLUX_HOME/logs/telegraf_nohup.out &'
alias stoptg='kill -15 $(pgrep telegraf)'