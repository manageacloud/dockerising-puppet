class wordpress-apache-ms {

  # No MySQL here
  # include "mysql-noinit"

  # Unsatisfied requirements in wordpress class
  package {"wget": ensure => latest}

  # Puppet forge wordpress class, removing mysql
  class { 'wordpress':
    install_dir => '/var/www/wordpress',
    db_user     => 'wp_user',
    db_password => 'password',
    create_db   => false,
    create_db_user => false
  }
 
  # Ad-hoc apache configuration
  include "apache-wordpress"
}
