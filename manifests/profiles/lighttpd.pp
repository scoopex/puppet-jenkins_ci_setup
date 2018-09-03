# == Class: puppet-jenkins_ci_setup::profiles::lighttpd
#
class puppet-jenkins_ci_setup::profiles::lighttpd(
	$installed,
  $message = "WELCOME TO THE DEMO INSTALLATION"
){
	if $installed {
		package{ 'lighttpd':
			ensure => present,
		}
		-> service { "lighttpd":
			ensure     => true,
			enable     => true
		}

    file { "/var/www/html/test.html":
      owner   => "www-data",
      group   => "www-data",
      mode    => '0644',
      content => "<h1>${message}</h1>",
    }
  }else{
		 package{ 'lighttpd':
			 ensure => absent,
		 }
     file { "/var/www/html/test.html":
			 ensure => absent,
     }
  }
}
