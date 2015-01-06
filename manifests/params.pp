class gutterball::params {
  $gutterball_conf_file = '/etc/gutterball/gutterball.conf'
  $dbuser = 'gutterball'
  $dbpassword = 'gutterball'
  $keystore_password = undef

  $tomcat = $::osfamily ? {
    /^(RedHat|Linux)/ => $::operatingsystem ? {
      'Fedora'  => 'tomcat',
      default   => $::operatingsystemrelease ? {
        /^7\./  => 'tomcat',
        default => 'tomcat6'
      }
    }
  }

  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        'Fedora': {
          $scl_prefix = ''
          $scl_root = ''
        }
        default: {
          $scl_prefix = 'ruby193-'
          $scl_root = '/opt/rh/ruby193/root'
        }
      }
    }
    default: {
      fail("${::hostname}: This module does not support osfamily ${::osfamily}")
    }
  }

}
