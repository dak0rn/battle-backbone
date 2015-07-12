define(
	lang: "JavaScript"
	short: "js"
	
	appfile: 'App.js'
	ext: 'js'
	config_request: 'var config = this.vent.request("config");'
	
	module_code: "define(['App'], function(App) {\n    App.module('ModuleName',function(Module, application, Backbone, Marionette, $, _) {\n        // Code\n    });\n};"
);