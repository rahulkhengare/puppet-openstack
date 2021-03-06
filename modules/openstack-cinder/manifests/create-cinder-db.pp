class openstack-cinder::create-cinder-db inherits openstack-cinder::params {

    notify {"Creating a new cinder database ":} ->
    exec { "create-${db_name}-db":
        unless => "/usr/bin/mysql -u${db_user} -p${db_password} ${db_name}",
        command => "/usr/bin/mysql -uroot -p$mysql_password -e \"create database ${db_name}; grant all privileges on ${db_name}.* to ${db_user}@localhost identified by '$db_password'; grant all privileges on ${db_name}.* to ${db_user}@'%' identified by '$db_password';\"",
    }


}
