class usap::addons inherits usap
{
     package { 'openssh':
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



                    }

         default: { package { 'c-shell':
                    name        => 'tcsh',
                    ensure      => installed        }

                    package { 'openssh':
                        name    => 'openssh-clients',
                        ensure  => installed
                        
                        }
                    
                    package { 'apache':
                        name    => 'httpd',
                        ensure  => installed

                    }

       }


 }
