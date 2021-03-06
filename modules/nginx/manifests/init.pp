class nginx {

        $backport_nginx = '1.6.2-5~bpo70+1'

        # Hard code versions
        package { "nginx-common":
          ensure => $backport_nginx,
        }->
        package { "nginx-full":
          ensure => $backport_nginx,
        }->
        package { "nginx":
          ensure => $backport_nginx,
        }

        file { "/etc/nginx/conf.d":
          ensure => directory,
          owner => 'root',
          mode   => '0755',
        }->

        file { "/etc/nginx/ssl_certs":
          ensure => directory,
          owner => 'root',
          mode   => '0700',
        }->

        file { "/etc/nginx/nginx.conf":
                ensure => file,
                content => template("nginx/nginx.conf.erb"),
                notify => Service["nginx"],
        }->

        file { "/etc/nginx/conf.d/basics.conf":
                source => "puppet:///modules/nginx/basics.conf",
                ensure => file,
        }->

        file { "/etc/logrotate.d/nginx":
                source => "puppet:///modules/nginx/logrotate.conf",
                ensure => file,
        }->

        file { "/etc/nginx/conf.d/types.conf":
                source => "puppet:///modules/nginx/types.conf",
                ensure => file,
        }->

        file { "/etc/nginx/conf.d/status.conf":
                ensure => file,
                source => "puppet:///modules/nginx/status.conf",
        }->

        file { "/var/log/nginx":
          ensure => directory,
          owner => 'root',
          mode   => '0755',
        }->

        service { "nginx":
                ensure => running,
        }
}
