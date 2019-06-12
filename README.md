Prometheus exporter使用
---------------------

**Mysql exporter**
--------------------------------------
使用mysql exporter之前需要先配置下你的mysql数据库:
1.首先需要给mysql赋予权限
```
GRANT REPLICATION CLIENT, PROCESS, SELECT ON performance_schema.* TO 'prometheus'@'%' IDENTIFIED BY ‘prometheus’;
GRANT REPLICATION CLIENT, PROCESS, SELECT ON performance_schema.* TO ‘prometheus’@'localhost' IDENTIFIED BY ‘prometheus’;
FLUSH PRIVILEGES;
```

2.启动mysql-exporter
```
helm upgrade --install mysql-exporter --namespace monitoring --set env.url=[ip] --set env.mysql_env='prometheus:prometheus@([ip:port])/' ./mysqld-exporter
```
--------------------------------------

**rabbitmq exporter**
--------------------------------------
rabbitmq的exporter使用比较简单,直接启动即可
```
helm upgrade --install rabbitmq-exporter --namespace monitoring --set env.url=[ip] --set env.rabbit_url=http://[ip:port] ./rabbitmq-exporter
```
--------------------------------------

**redis exporter**
--------------------------------------
redis exporter同样直接启动即可
```
helm upgrade --install redis-exporter --namespace monitoring --set env.url=[ip] --set env.redis_addr=[ip:port] --set env.redis_password=[password] ./redis-exporter
```
--------------------------------------

**kafka exporter**
--------------------------------------
kafka exporter需要提前配置下hosts解析.
编辑 prometheus-exporter\kafka-exporter\templates 下的kafka-exporter.yaml,将kafka节点的主机名和IP提前填写上
![kafka](https://raw.githubusercontent.com/feiyu563/PrometheusAlert/master/img/kafka.png)

然后启动kafka exporter即可
```
helm upgrade --install kafka-exporter --namespace monitoring --set env.url=[hostname] --set env.kafka_addr=[hostname:port] ./kafka-exporter
```
--------------------------------------

**zookeeper exporter**
--------------------------------------
zookeeper的exporter使用比较简单,直接启动即可
```
helm upgrade --install zookeeper-exporter --namespace monitoring --set env.url=[hostname] --set env.zookeeper_addr=[ip:port] ./zookeeper-exporter
```
--------------------------------------

**ceph exporter**
--------------------------------------
ceph的exporter操作起来也不算麻烦,如果是使用ceph-deploy部署的,那么直接把ceph-monitor节点的 /etc/ceph目录下的文件直接全部复制到 prometheus-exporter\ceph-exporter\ceph 目录下
然后直接使用helm运行起来就行了
```
helm upgrade --install ceph-exporter --namespace monitoring ./ceph-exporter
```
