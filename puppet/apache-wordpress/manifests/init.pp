class apache-wordpress {

  package { ["apache2", "libapache2-mod-php5", "php5-mysql"]: ensure => latest}

  service { "apache2":
     ensure => running,
     hasstatus => true,
     hasrestart => true,
     require => Package["apache2"],
  }

  file {'/etc/apache2/sites-enabled/wordpress.conf':
    source  => "puppet:///modules/wordpress-all-in-one/wordpress.conf",
    ensure  => present,
    owner   => "www-data",
    group   => "www-data",
    require => Package["apache2"],
    notify  => Service["apache2"]
  }

  file {['/etc/apache2/sites-enabled/000-default.conf', '/etc/apache2/sites-enabled/default-ssl.conf'] :
    ensure => absent,
    require => Package["apache2"],
    notify  => Service["apache2"]
  }

}
