# Install and Configure gutterball
#
# == Parameters:
#
# $gutterball_conf_file::   Gutterball configuration file
#                           default '/etc/gutterball/gutterball_conf_file'
#
# $db_user::                The Gutterball database username;
#                           default 'gutterball'
#
# $db_password::            The Gutterball database password;
#                           default 'redhat'
#
# $tomcat::                 The system tomcat to use, tomcat6 on RHEL6 and tomcat on most Fedoras
#
# $keystore_password_file:: File to store the keystore password
#
class gutterball (
  $gutterball_conf_file = $gutterball::params::gutterball_conf_file,
  $dbuser = $gutterball::params::dbuser,
  $dbpassword = $gutterball::params::dbpassword,
  $keystore_password_file = $gutterball::params::keystore_password_file,
  $tomcat = $gutterball::params::tomcat,
) inherits gutterball::params {


  # TODO
  class { 'gutterball::install': } ~>
  class { 'gutterball::config':  } ~>
  class { 'gutterball::database': } ~>
  class { 'gutterball::service': } ~>
  Class['gutterball']

}
