class users
{

    user { 's3116979':
        ensure  => present,
        uid     => '13116979',
        gid     => '1010',
        shell   => '/bin/bash',
        home    => '/home/sh9/S3116979'
    }



}
