class usap::addons inherits usap {

     package { 'openssh-server':
            name    => 'openssh-server',
            ensure  => installed
        
         }
    
     package { 'terminal multiplexer':
            name    => 'tmux',
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
                    ensure      => installed    }

                    package { 'vim(debian)':
                    name        => 'vim',
                    provider    => 'apt',
                    ensure      => installed    }                            

                    package { 'gcc(debian)':
                    name        => 'gcc',
                    provider    => 'apt',
                    ensure      => installed    }

                    }

         default: { 
                    
                    # install  gcc
                    exec { 'yum groupinstall Development Tools':
                    command     => '/usr/bin/yum -y --disableexcludes=all groupinstall "Development Tools"',
                    unless      => '/usr/bin/yum grouplist "Development Tools" | /bin/grep "^Installed"',
                    timeout     => 600
                    
                        }
             
                    package { 'epel-release':
                    ensure      => installed,
                    provider    => rpm,
                    source      => 'file:///modules/usap/epel-release-latest-7.noarch.rpm'
                    
                        }

                    exec { 'enable optional channel (AWS)':
                    command     => '/usr/bin/yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional'

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
                        require => Package[ 'epel-release' ]
                        
                        }
                    
                    package { 'vim':
                        name    => 'vim-enhanced',
                        ensure  => installed
                       
                        }

                    

}


}

}
