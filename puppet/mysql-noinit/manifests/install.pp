class mysql-noinit::install {

    exec { "install_mysql":
      command => '/bin/bash -c "echo mysql-server mysql-server/root_password password secretpass | debconf-set-selections && echo mysql-server mysql-server/root_password_again password secretpass | debconf-set-selections  && DEBIAN_FRONTEND=noninteractive apt-get install mysql-server-5.5 -y"',
      path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
      unless  => "dpkg -l mysql-server-5.5",
      timeout => 0
    }

   exec { "start_mysql":
      path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
      command => "/etc/init.d/mysql start",
      unless  => "/etc/init.d/mysql status",
      require => [Exec["install_mysql"]]
    }

    file { "/root/.my.cnf":
      ensure => link,
      target => "/etc/mysql/debian.cnf"
    }

}
