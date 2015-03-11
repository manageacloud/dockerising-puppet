class mysql-noinit::configure {

    #$db_host = 'localhost'
    $db_host = '%'
    $db_name = 'wordpress'
    $db_user = 'wp_user'
    $db_password = 'password'

    mysql_database { "${db_host}/${db_name}":
      name => $db_name,
      charset => 'utf8',
    }

    mysql_user { "${db_user}@${db_host}":
      password_hash => mysql_password($db_password),
    }

    mysql_grant { "${db_user}@${db_host}/${db_name}.*":
      table      => "${db_name}.*",
      user       => "${db_user}@${db_host}",
      privileges => ['ALL'],
    }
}
