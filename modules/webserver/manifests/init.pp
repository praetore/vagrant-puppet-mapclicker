class webserver {
	package { 'nginx':
		ensure => installed,
	}

	file { '/etc/nginx/sites-available/default':
		notify  => Service["nginx"],
		ensure => 'present',
		owner => 'nobody',
		group => 'nogroup',
		source => 'puppet:///modules/webserver/default',
		require => [Package['nginx'], Class['appserver']],
	}

	service { 'nginx':
		ensure => running,
		enable => true,
		require => [Package['nginx'], Class['appserver']],
	}
}
