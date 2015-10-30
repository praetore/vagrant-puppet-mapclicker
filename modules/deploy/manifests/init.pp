class deploy {
	$repo = '/home/vagrant/mapclicker'
	$remote = 'https://github.com/praetore/MapClicker.git'
	$www = '/var/www'

	vcsrepo { 
		$repo:
			ensure   => latest,
			provider => git,
			source   => $remote,
			require => Class['git'],
	}

	file {
		$www:
			ensure => 'directory',
			owner => 'nobody',
			group => 'nogroup',
	}

	file { 
		$::appdir:
			ensure => 'link',
			target => $repo,
			require => [Vcsrepo[$repo], File[$www]],
	}
}
