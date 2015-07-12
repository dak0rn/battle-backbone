define [
	'App',
	'text!./template/Error.html'
], (App, html) ->
	
	App.module 'Error', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.ErrorView extends Marionette.ItemView
			template: _.template html
			
			ui:
				link: '.back-home'
			
			behaviors:
				FadeBehavior: {}
				AutoLinkBehavior: {}