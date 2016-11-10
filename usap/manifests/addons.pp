class usap::addons inherits usap
{
    
     case $::osfamily {
        
        
        'debian': { package { 'c-shell(debian)':
                    name        => 'csh',
                    provider    => 'apt',
                    ensure      => installed    } }

         default: { package { 'c-shell':
                    name        => 'tcsh',
                    ensure  => installed    } }

       }


 }
