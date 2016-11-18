# sysadmin, cars, trucks, and ambulance groups are defined in this class
# each user has its own group
class usap::groups inherits usap { 

group { 'cars':
  ensure => present,
  gid    => '1011' }
    
group { 'trucks':
  ensure => present,
  gid    => '1012' }
    
group { 'ambulances':
  ensure => present,
  gid    => '1013' }

group { 'sysadmin':
  ensure => present,
  gid    => '1010' } 
    
group { 'becca':
  ensure => present,
  gid    => '1014' }

group { 'fred':
  ensure  => present,
  gid     => '1015'}

group { 'wilma':
  ensure  => present,
  gid     => '1016'}

}
