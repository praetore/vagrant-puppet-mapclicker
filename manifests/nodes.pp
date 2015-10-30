node 'default' {
	include updates
	include git
	include upstart
	include deploy
	include dependencies
	include database
	include appserver
	include webserver
}
