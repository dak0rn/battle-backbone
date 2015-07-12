#
# View for a single panel
# in the "Provides" section
#
define [
	'App',
	'text!./template/Panel.html',
], (App, html) ->
	
	App.module 'Home', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.ProvidesBox extends Marionette.ItemView
			template: _.template html
			tagName: 'div'
			className: 'col-md-6'