class addons
{
    
    package { 'c-shell(redhat)':
        name        => 'tcsh',
        provider    => 'yum'
        } 
    package { 'c-shell(debian)':
        name        => 'csh',
        provider    => 'apt'
        
        }
    package { 'c-shell(suse)':
        name        => 'tcsh',
        provider    => 'zypper'
       
        }
    
     case $::osfamily {
        
        'redhat': { package { 'c-shell(redhat)':
                    ensure  => installed    } }
        
        'debian': { package { 'c-shell(debian)':
                    ensure  => installed    } }

         default: { package { 'c-shell(suse)':
                    ensure  => installed    } }

       }


 }
