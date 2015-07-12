define(
	lang: "CoffeeScript",
	short: "cs",
	
	appfile: 'App.coffee',
	
	ext: 'coffee',
	config_request: 'config = @vent.request "config"'
	module_code: "define ['App'], (App) ->\n    App.module 'ModuleName', (Module, application, Backbone, Marionette, $, _) ->\n        // Code"
);