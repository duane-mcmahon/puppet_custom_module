class usap::addons inherits usap {

     package { 'openssh-server':
            name    => 'openssh-server',
            ensure  => installed
        
         }

     case $::osfamily {
        
        
        'debian': { package { 'c-shell(debian)':
                    name        => 'csh',
                    provider    => 'apt',
                    ensure      => installed    } 
                    
                    package { 'openssh(debian)':
                    name        => 'openssh-client',
                    provider    => 'apt',
                    ensure      => installed    }

                    package { 'apache(debian)':
                    name        => 'apache2',
                    provider    => 'apt',
                    ensure      => installed    }
    
                    package { 'lynx browser(debian)':
                    name        => 'lynx',
                    provider    => 'apt',
                    ensure      => 'installed'  }

                    

                    }

         default: { package { 'EPEL':
                        ensure      => installed,
                        source      => 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
                                               
                        }

                    package { 'c-shell':
                        name        => 'tcsh',
                        ensure      => installed
                       
                        }

                    package { 'openssh':
                        name    => 'openssh-clients',
                        ensure  => installed
                        
                        }
                    
                    package { 'apache':
                        name    => 'httpd',
                        ensure  => installed

                        }

                    package { 'lynx browser':
                        name    => 'lynx',
                        ensure  => installed,
                        require => Package[ 'EPEL' ]
                        
                        }

       }

}


}
