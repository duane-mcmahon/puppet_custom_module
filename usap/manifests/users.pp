class usap::users inherits usap
{

    user { 'becca':
        ensure  => present,
        comment => 'usap-a2-m2 user',
        uid     => '10016979',
        groups  => [ 'sysadmin', 'cars' ],
        shell   => '/bin/bash',
        home    => '/home/becca',
        managehome  => true,
        password    => '$1$wEsrrz/S$ZZKqcwxhlVs2HYgdWWCG40'
    }

    file { '/home/becca':
        ensure  => directory,
        require => [ User['becca'] ]
    }

    user { 'fred':
        ensure  => present,
        comment => 'usap-a2-m2 user',    
        uid     => '10026979',
        groups  => [ 'trucks', 'cars' ],
        shell   => '/bin/csh',
        home    => '/home/fred',
        managehome  => true,
        password    => '$1$rsLAFqRL$bOhVj.VxPee88RL6YS1Cg0'
        }
    
    file { '/home/fred':
        ensure  => directory,
        require => [ User['fred'] ]
        }

    user { 'wilma':
        ensure  => present,
        comment => 'usap-a2-m2',
        uid     => '10036979',
        groups  => [ 'trucks', 'cars', 'ambulances' ],
        home    => '/home/wilma',
        managehome  => true,
        password    => '$1$Ra4iII.f$SdE/vaCA/vsONxkguSy53/'
        }
    
    file { '/home/wilma':
        ensure  => directory, 
        require => [ User['wilma'] ]
        }
    ssh_authorized_key { 'wilma@ec2-54-206-127-221.ap-southeast-2.compute.amazonaws.com':
        ensure  => present,
        user    => 'wilma',
        type    => 'ssh-rsa',
        key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDtgELFKnKKo1H23mD+CVAgEGeLgw3yzlgkNgD0lUZ39pPv3L4dV3uqD3pFDmRcOTYzjY5VlDErp2r0R27btaoIs1qvswFB4PRs75xOGQQeNROatqYs2DCHYAUUqFRErEQjN0ggo4jrnH9RGkpAJ+CyjiyN8ZViiO+iyAE/JSRM/X2r6PlFar8iCpiGmKV0Gw9y5osiqqg9p4YsGvkk90HIw9o2HOhq3kLRf6KL4+AsHxbljUJzC70I+rY4UFNqaubusnJDcDZbC4kyO3YAP3msv/UvoOvWpqVzXQUpp4ew2GMdO0e2MwmXdSdxiz4xxVKU3F6JfBIaKgdcryDzQ0Mj=='
   
        }
    


}
