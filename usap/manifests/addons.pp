class addons
{

    package { 'rubygems':
        ensure      => present
        }
    package { 'puppet-lint':
        ensure      => '1.1.0',
        provider    => 'gem', 
        require     => Package['rubygems']
        }    
    
    
    
    
 }
