#redis
helm upgrade --install redis-exporter --namespace monitoring --set env.url=[ip] --set env.redis_addr=[ip:port] --set env.redis_password=[password] ./redis-exporter

#rabbitmq
helm upgrade --install rabbitmq-exporter --namespace monitoring --set env.url=[ip] --set env.rabbit_url=http://[ip:port] ./rabbitmq-exporter

#mysql
helm upgrade --install mysql-exporter --namespace monitoring --set env.url=[ip] --set env.mysql_env='prometheus:prometheus@([ip:port])/' ./mysqld-exporter

#zookeeper
helm upgrade --install zookeeper-exporter --namespace monitoring --set env.url=[hostname] --set env.zookeeper_addr=[ip:port] ./zookeeper-exporter

#ceph
helm upgrade --install ceph-exporter --namespace monitoring ./ceph-exporter

#kafka
helm upgrade --install kafka-exporter --namespace monitoring --set env.url=[hostname] --set env.kafka_addr=[hostname:port] ./kafka-exporter
