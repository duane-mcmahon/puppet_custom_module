class usap::services inherits usap {

service { 'sshd':
    ensure  => running,
    enable  => true,
    require => Package[ 'openssh-server' ]
        
    }

# file { '/etc/ssh/sshd_config':
#    notify  => Service[ 'sshd' ],
#    mode    => '0600',
#    owner   => 'root',
#    group   => 'root',
#    require => Package[ 'openssh-server' ]

#   }


# mariadb
service { 'mysql':
    ensure  => running,
    enable  => true

}

case $::osfamily {

        'debian': { service { 'apache2':

                    ensure  => running,
                    enable  => true     }   

        }
        
        default: { service { 'httpd':

                    ensure  => running,
                    enable  => true     }
    
        }
}

}
