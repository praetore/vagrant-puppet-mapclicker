class dependencies {
	$reqs = join([$::appdir, 'requirements.txt'], '/')

	class { 'python':
		version    => 'system',
		pip        => 'present',
		dev        => 'present',
		virtualenv => 'present',
	}

	file { '/home/vagrant/.envs/':
		ensure => 'directory',
		owner => 'vagrant',
		group => 'vagrant',
		require => Class['deploy'],
	}
	
	package { 'libpq-dev':
		ensure => 'installed',
	}

	python::virtualenv { 
		$::envdir:
			ensure => present,
			version => 'system',
			owner => 'vagrant',
			group => 'vagrant',
			cwd => '/home/vagrant',
			requirements => $reqs,
			require => [Class['database'], Class['deploy'], File['/home/vagrant/.envs/'], Package['libpq-dev']],
	}
}
