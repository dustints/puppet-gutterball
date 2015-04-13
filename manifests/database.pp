class gutterball::database{
  include postgresql::server

  postgresql::server::pg_hba_rule { 'allow authenticated users over ipv4 loopback':
    type        => 'host',
    database    => 'all',
    user        => 'all',
    address     => '127.0.0.1/32',
    auth_method => 'password',
  }

  postgresql::server::db { 'gutterball':
    user     => $gutterball::dbuser,
    password => $gutterball::dbpassword,
  } ~>
  file { '/usr/bin/gbdb':
    ensure  => file,
    content => template('gutterball/gbdb.conf.erb'),
    mode    => '0777',
    owner   => 'root',
    group   => 'root',
  } ~>
  exec { 'migrate database':
      path        => ['/usr/bin', '/bin'],
      command     => "gbdb migrate \
        --username=${gutterball::dbuser}\
        --password=${gutterball::dbpassword}",
      refreshonly => true
  }


}
