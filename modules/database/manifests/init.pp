class database {
	class { 'postgresql::server': }

	postgresql::server::db { $::dbname:
		user     => $::dbuser,
		password => postgresql_password($::dbuser, $::dbpassword),
	}
}
