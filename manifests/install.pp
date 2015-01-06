class gutterball::install {

  package { "${gutterball::scl_prefix}rubygem-foreman_gutterball":
    ensure => 'installed'
  }

}
