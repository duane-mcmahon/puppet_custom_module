class groups
{

    group { 'dg-adm-teaching-linux-allusers':
        ensure => present,
        gid => '1010'
        }    
    
    
    
}
