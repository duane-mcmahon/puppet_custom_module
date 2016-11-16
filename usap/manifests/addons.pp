class usap::addons inherits usap {

     package { 'openssh-server':
            name    => 'openssh-server',
            ensure  => installed
        
         }
    
     package { 'terminal multiplexer':
            name    => 'tmux',
            ensure  => installed
     
         }

     package { 'gnu debugger (gdb)':
            name    => 'gdb',
            ensure  => present

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

                    package { 'emacs(debian)':
                    name        => 'emacs24',
                    provider    => 'apt',
                    installed   => true         }

                    package { 'mariadb-server(debian)':
                    name        => 'mariadb-server',
                    provider    => 'apt',
                    installed   => true         }

                    package { 'mariadb-server(debian)':
                    name        => 'mariadb-client',
                    provider    => 'apt',
                    installed   => true         }

                    package { 'sshfs(debian)':
                    name        => 'sshfs',    
                    provider    => 'apt',
                    installed   => true         }

                    package { 'vnc-server(debian)':
                    name        => 'vnc4server',
                    provider    => 'apt',
                    installed   => true         }

                    package { 'cgdb(debian)':
                    name        => 'cdgb',
                    provider    => 'apt',
                    ensure      => installed    }

                    package { 'dia2code(debian)':
                    name        => 'dia2code',
                    provider    => 'apt',
                    ensure      => 'installed'  }


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
                    provider    => 'rpm',
                    source      => 'file:///modules/usap/epel-release-latest-7.noarch.rpm'
                    
                        }
                        
                    package { 'dia2code':
                    ensure      => installed,
                    provider    => 'rpm',
                    source      => 'http://sourceforge.net/projects/dia2code/files/dia2code/0.8.3/dia2code-0.8.3-1.x86_64.rpm/download'
                        }

                    if $ec2_instance_id and $operatingsystem == 'RedHat' {     
                    exec { 'enable optional channel (AWS)':
                    command     => '/usr/bin/yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional' }
              
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

                    package { 'sshfs':
                        name    => 'sshfs',
                        ensure  => installed,
                        require => Package[ 'epel-release' ]
                        
                        } 
                        
                    package { 'cgdb':
                        name    => 'cgdb',
                        ensure  => installed,
                        require => Package[ 'epel-release' ]
                        
                        }


                    package { 'dia2code(rhel)':
                        name    => 'dia2code',
                        ensure  => installed,
                        require => Package[ 'dia2code' ]

                        }

                    package { 'vim':
                        name    => 'vim-enhanced',
                        ensure  => installed
                       
                        }

                    package { 'emacs':
                        name    => 'emacs',
                        ensure  => installed 
                        
                        }

                    package { 'mariadb':
                        name    => 'mariadb',
                        ensure  => installed 

                        }
 # The standard tool for interacting with MariaDB is the mariadb client,
 # which installs with the mariadb-server package.
                    package { 'mariadb-server':
                        name    => 'mariadb-server',
                        ensure  => installed

                        }
 
                    package { 'vnc-server':
                        name    => 'tigervnc-server',
                        ensure  => installed 
                        
                        }
    
        #  a step in the configuration process for tiger vnc

     exec { 'configure vnc server':
                    command     => '/usr/bin/cp /usr/lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service', 
                    unless      => '/usr/bin/test -f /etc/systemd/system/vncserver@.service' }

}


}

}
