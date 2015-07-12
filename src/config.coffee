#
# Application configuration file
#
define [], () ->
	
	# Application modules
	modules:
		test: 'Test.Controller@test'
		#        ^    ^         ^--- Event to use: show:#{name}
		#        ^    ^      
		#	     ^    ^--- 'Class'
		#		 ^
		# ^      ^--- modules/#{name}/index
		# ^			  Must be the same as the marionette module!
		# ^
		# ^--- Base route
		'404': 'Error.Controller@error'
		home: 'Home.Controller@home'
		docs: 'Docs.Controller@docs'
		cookies: 'Cookie.CookieController@cookies'
	
	routes:
		# Home route
		home: 'home'
		
		# Route for errors
		error: '404'
	
	# Application services
	services: [
		'title',
		'navigation',
		'footer',
		'layout',
		'behaviors',
		'navbar',
		'scroll'
	]
	
	routerOptions: window.__ps
	
	# Normally one wouldn't do that but we use
	# fake API here
	api: "#{window.__api}/fake-api" 
	
	languages: ['ln-JS','ln-CF']
	defaultLanguage: 'ln-CF'

	# Pattern that matches the language in the URL
	# Default: IETF long format, e.g. en_US or en-US
	# If you change this you have to update your localization files
	# and the language definitions above!
	languagePattern:  /^(\w\w[-_]\w\w)[/]?(.*)$/