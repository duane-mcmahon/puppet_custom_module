class usap::services inherits usap {

service { 'sshd':
    ensure  => running,
    enable  => true,
    require => Package[ 'openssh-server' ]
        
    }

 file { '/etc/ssh/sshd_config':
    content  => epp('usap/4a.epp', { 'root_login' => 'no'}),
    notify  => Service[ 'sshd' ],
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => Package[ 'openssh-server' ]

   }


# mariadb
service { 'mariadb':
    ensure  => running,
    enable  => true,
    require => Package[ 'mariadb' ] 

}


case $::osfamily {

        'debian': { service { 'apache2':

                    ensure  => running,
                    enable  => true     }   


                    file { '/etc/apache2/apache2.conf':
                        ensure  => present,
                        source  => '/etc/apache2/apache2.conf',
                        owner   => 'root',
                        group   => 'root',
                        mode    => '0664',
                        require => Package['apache2'],
                        notify  => Service['apache2']
                        
                        }


                    # file serving directory
                    file { '/var/www/s3116979':
                    ensure  => 'directory',
                    owner   => 'root',
                    group   => 'www-data',
                    mode    => '2775'
    
    }
            

        }
        
        default: { service { 'httpd':
                    ensure  => running,
                    enable  => true     }                  
                    

                   # probably not a good solution but solves some issues accessing web server 
                   file { '/etc/sysconfig/selinux':
                    content => epp('usap/selinux_config.epp', { 'state' => 'disabled'  }) }


                   file { '/etc/httpd/conf/httpd.conf':
                   ensure   => present,
                   content  => epp('usap/4b.epp', { 'doc_root' => '/var/www/s3116979'}),
                   owner    => 'root',
                   group    => 'root',
                   mode     => '0664',
                   require  => Package['apache'],
                   notify   => Service['httpd'] }


                    # file serving directory
                    file { '/var/www/s3116979':
                    ensure  => 'directory',
                    owner   => 'root',
                    group   => 'apache',
                    mode    => '2775'  }


                   service {'vncserver':
                   ensure   => running,
                   enable   => true     }

                   file { '/etc/sysconfig/vncservers':
                   ensure   => present,
                   source   => '/etc/sysconfig/vncservers',
                   owner    => 'root',
                   group    => 'root',
                   mode     => '0664',
                   require  => Package['vnc-server'],
                   notify   => Service['vncserver'] }

                   file {'/etc/my.cnf':
                   ensure   => present,
                   source   => '/etc/my.cnf',
                   owner    => 'root',
                   group    => 'root',
                   mode     => '0664',
                   require  => Package['mariadb-server'],
                   notify   => Service['mariadb']  }           
                       
                      
    

                 }
}

}
