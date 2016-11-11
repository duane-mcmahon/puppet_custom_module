class usap::services inherits usap {
 

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
