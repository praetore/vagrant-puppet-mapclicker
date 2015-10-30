class appserver {
	$dbstring = join(['postgresql://', $::dbuser, ':', $::dbpassword, '@localhost:5432/', $::dbname], '')
	$dbparam = join(['-e DATABASE_URL=', $dbstring], '')
	$bind = join(['--bind=', $::bind], '')
	$executable = join([$::envdir, 'bin', join(['gunicorn', $dbparam, $bind, 'app:app'], ' ')], '/')

	upstart::job { 'gunicorn_service':
		description    => "This service starts Flask with gunicorn",
		version        => "3626f2",
		respawn        => true,
		respawn_limit  => '5 10',
		user           => 'nobody',
		group          => 'nogroup',
		chdir          => $::appdir,
		exec           => $executable,
		require				 => Python::Virtualenv[$::envdir],
	}
}
