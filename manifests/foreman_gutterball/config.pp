class gutterball::foreman_gutterball::config(
    $foreman_user  = 'foreman',
    $foreman_group = 'foreman',
    $foreman_plugins_dir = '/usr/share/foreman/plugins'
  ){
  file { "${foreman_plugins_dir}/gutterball.yaml":
    ensure  => file,
    content => template('gutterball/foreman_gutterball.yaml.erb'),
    owner   => $foreman_user,
    group   => $foreman_group,
    mode    => '0644',
  }
}
