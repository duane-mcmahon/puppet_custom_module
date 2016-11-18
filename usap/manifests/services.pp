# services that need to be run (and enabled ) are declared in this class
class usap::services inherits usap {

# SSH server

service { 'sshd':
  ensure  => running,
  enable  => true,
  require => Package[ 'openssh-server' ] }


# mariadb mysql server

service { 'mariadb':
  ensure  => running,
  enable  => true,
  require => Package[ 'mariadb' ] }


case $::osfamily {

        'debian': { 
            
                    # apache web server
            
                    service { 'apache2':
                      ensure  => running,
                      enable  => true     }   


                    # service for vnc server (placeholder)
            

        }
        
        default: { 
            
                   # apache web server
            
                   service { 'httpd':
                     ensure  => running,
                     enable  => true     }                  
                   
                   # vnc server

                   service {'vncserver@:1.service':
                     ensure   => running,
                     enable   => true     }   

                 }
}

}
