# managed files
class usap::files inherits usap {

# Task 4e: add /usr/local/bin to PATH for each user
file { '/home/.bash_profile':
  ensure  => present,
  content => epp('usap/4e.epp') }


# Manage / create users' home directories
file { '/home/becca':
  ensure  => 'directory',
  require => User[ ['becca'] ] }

file { '/home/fred':
  ensure  => 'directory',
  require => User[ ['fred' ] ] }

file { '/home/wilma':
  ensure  => 'directory',
  require => User[ ['wilma'] ] }

# OpenSSH config file

file { '/etc/ssh/sshd_config':
  content  => epp('usap/4a.epp', { 'root_login' => 'no'}),
  notify   => Service[ 'sshd' ],
  mode     => '0600',
  owner    => 'root',
  group    => 'root',
  require  => Package[ 'openssh-server' ]}


case $::osfamily {

        'debian': {  

                    # apache config file 

                    file { '/etc/apache2/apache2.conf':
                      ensure  => present,
                      content => epp('usap/4b.epp', { 'doc_root' => '/var/www/s3116979' }),
                      owner   => 'root',
                      group   => 'root',
                      mode    => '0664',
                      require => Package['apache2'],
                      notify  => Service['apache2'] }


                    # web serving directory

                     file { '/var/www/s3116979':
                       ensure  => 'directory',
                       owner   => 'root',
                       group   => 'www-data',
                       mode    => '2775' }
            

        }
        
        default: {                   
                    
                   # apache config file

                   file { '/etc/httpd/conf/httpd.conf':
                     ensure   => present,
                     content  => epp('usap/4b.epp', { 'doc_root' => '/var/www/s3116979'}),
                     owner    => 'root',
                     group    => 'root',
                     mode     => '0664',
                     require  => Package['apache'],
                     notify   => Service['httpd'] }


                   # web server directory

                   file { '/var/www/s3116979':
                     ensure  => 'directory',
                     owner   => 'root',
                     group   => 'apache',
                     mode    => '2775'  }

                   # config files for tiger vnc server  

                   file { '/etc/sysconfig/vncservers':
                   ensure   => present,
                   source   => '/etc/sysconfig/vncservers',
                   owner    => 'root',
                   group    => 'root',
                   mode     => '0664',
                   require  => Package['vnc-server'],
                   notify   => Service['vncserver@:1.service'] }

                   file { '/etc/systemd/system/vncserver@.service':
                     content  => epp( 'usap/tiger_vnc.epp', { 'user' => 'wilma' } ) }

                   # config file for mysql/mariadb service

                   file {'/etc/my.cnf':
                   ensure   => present,
                   source   => '/etc/my.cnf',
                   owner    => 'root',
                   group    => 'root',
                   mode     => '0664',
                   require  => Package['mariadb-server'],
                   notify   => Service['mariadb']  }           
                       
                 }
}

}
