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

         default: { file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7':
                    owner       => root,
                    group       => root,
                    mode        => '0644',
                    source      => 'puppet:///modules/usap/RPM-GPG-KEY-EPEL-7'

                    }
             
             
             
                    yumrepo { 'EPEL':
                        descr       => 'Extra Packages for Enterprise Linux',
                        baseurl     => 'https://download.fedoraproject.org/pub/epel/7/$basearch',
                        mirrorlist  => 'https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel7&arch=$basearch',
                        enabled  	=> true,
                        gpgcheck    => true,
                        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7',
			            require     => File[ '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7' ]
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
                        require => Yumrepo[ 'EPEL' ]
                        
                        }

       }

}


}
