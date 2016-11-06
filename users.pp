class users
{

    user { 's3116979':
        ensure  => present,
        comment => 'lab 10 test user',
        uid     => '13116979',
        gid     => '1010',
        shell   => '/bin/bash',
        home    => '/home/sh9/S3116979',
        managehome  => true
    }

    file { '/home/sh9/S3116979':
        ensure  => directory,
        require => [ User['s3116979'], File['sh9'] ];
        '/home/sh9':
        ensure  => directory,
        alias   => 'sh9'
    }
       
}
