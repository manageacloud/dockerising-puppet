class container-wordpress-ms { 

    class { 'docker':
            extra_parameters=> ['--insecure-registry registry.manageacloud.com.au:5000']
    }

    docker::run { 'db':
            image           => 'registry.manageacloud.com.au:5000/puppet_ms_mysql',
            command         => '/usr/sbin/mysqld --bind-address=0.0.0.0',
            use_name        => true
    }
    docker::run { 'web':
            image           => 'registry.manageacloud.com.au:5000/puppet_ms_apache',
            command         => '/usr/sbin/apache2ctl -D FOREGROUND',
            ports           => ['80:80'],
            links           => ['db:db'],
            use_name        => true,
            depends         => ['db'],
    }
}
