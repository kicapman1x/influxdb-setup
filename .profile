##influxdb##
export INFLUX_HOME='/home/daddy/apps/influxdb/influxdb2-2.7.12'
export TELEGRAF_HOME='/home/daddy/apps/influxdb/telegraf-1.36.3'
export GRF_HOME='/home/daddy/apps/influxdb/grafana-12.2.1'
export INFDB_ADMIN_USER=$(grep 'user' $SECRETS_DIR/influxdb_cred | cut -d'=' -f2)
export INFDB_ADMIN_PW=$(grep 'password' $SECRETS_DIR/influxdb_cred | cut -d'=' -f2)
export GRF_ADMIN_USER=$(grep 'user' $SECRETS_DIR/grafana_cred | cut -d'=' -f2)
export GRF_ADMIN_PW=$(grep 'password' $SECRETS_DIR/grafana_cred | cut -d'=' -f2)
export INFDB_ADMIN_TOKEN=$(cat $SECRETS_DIR/influxdb_token)
export INFLUX_CONFIGS_PATH=$INFLUX_HOME/data/influxdbv2/influx.conf
export GRF_CONFIGS_PATH=$GRF_HOME/conf/grafana.ini

alias startinfdb='nohup $INFLUX_HOME/usr/bin/influxd --http-bind-address=influx.han.gg:8086 --sqlite-path=$INFLUX_HOME/data/influxdbv2/influxd.sqlite --bolt-path=$INFLUX_HOME/data/influxdbv2/influxd.bolt --engine-path=$INFLUX_HOME/data/influxdbv2/engine > $INFLUX_HOME/logs/influxd.log &'
alias stopinfdb='kill -15 $(pgrep influxd)'
alias influx='$INFLUX_HOME/usr/bin/influx'
alias starttg='nohup $TELEGRAF_HOME/usr/bin/telegraf --config $TELEGRAF_HOME/etc/telegraf/telegraf.conf > $INFLUX_HOME/logs/telegraf_nohup.out &'
alias stoptg='kill -15 $(pgrep telegraf)'
function startgrf() {
    export LDAP_BIND_PW="$(grep admin_password $SECRETS_DIR/ldap_cred | cut -d"=" -f2)"
    nohup $GRF_HOME/bin/grafana-server --config $GRF_HOME/conf/grafana.ini > $GRF_HOME/log/grf.out &
}
alias stopgrf='kill -15 $(pgrep grafana)'