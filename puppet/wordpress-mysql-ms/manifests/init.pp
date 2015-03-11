class wordpress-mysql-ms {

  # Install MySQL
  include "mysql-noinit"

  # Unsatisfied requirements in wordpress class
  # package {"wget": ensure => latest}

  # Puppet forge wordpress class, removing mysql
  # class { 'wordpress':
  #  install_dir => '/var/www/wordpress',
  #  db_user     => 'wp_user',
  #  db_password => 'password',
  #}
 
  # Apache configuration not needed
  # include "apache-wordpress"
}
