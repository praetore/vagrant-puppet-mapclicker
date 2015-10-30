class updates {
	class { 'apt':
		update => {
		  frequency => 'daily',
		},
	}
}
