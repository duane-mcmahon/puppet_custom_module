class groups
{

    group { 'sysadmin':
        ensure => present,
        gid => '1010'
        }   

    group { 'cars':
        ensure => present,
        gid => '1011'
    }
    
    group { 'trucks':
        ensure => present,
        gid => '1012'
     }
    
    group { 'ambulances':
        ensure => present,
        gid => '1013'
     }
}
