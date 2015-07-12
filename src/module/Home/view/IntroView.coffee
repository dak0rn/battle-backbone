#
# Intro view
#
define [
	'App',
	'text!./template/Intro.html',
], (App, html) ->
	
	App.module 'Home', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.IntroView extends Marionette.ItemView
			template: _.template html
			className: 'intro-view view-container'
			behaviors:
				AutoLinkBehavior: {}