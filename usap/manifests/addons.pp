# packages are declared in this class
class usap::addons inherits usap {

# Openssh -server, terminal multiplexer, gnu debugger

$common_packages = [ 'openssh-server', 'tmux', 'gdb' ]

     package { $common_packages:
       ensure  => installed }

    # Task 2: set the $runinterval variable to 20 minutes
    
    exec { 'set-runinterval':
        command   => '/usr/local/bin/puppet config set runinterval 1200',
        unless    => '/usr/local/bin/puppet `agent --configprint runinterval` -eq 1200' 

        }

    # Task 4e.

    # no working implementation. 

     case $::osfamily {
        
        
       'debian': {
            
            $debian_packages = [ 'csh', 'openssh-client', 'apache2', 'lynx', 'vim', 'gcc', 'emacs24', 'mariadb-server', 'mariadb-client', 'sshfs', 'dia2code', 'vnc4server', 'cgdb' ]


            package { $debian_packages:
                    
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
             
                    # self-described
                    package { 'epel-release':
                      ensure      => installed,
                      provider    => 'rpm',
                      source      => 'file:///modules/usap/epel-release-latest-7.noarch.rpm'
                    
                        }
                        
                    # self-described    
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
