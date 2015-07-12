#
# View for the home page
#
define [
	'App',
	'i18n!../nls/locale',
	'text!./template/HomeLayout.html',
	'css!../css/Home.css'
], (App, lang, html) ->
	
	App.module 'Home', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.HomeLayout extends Marionette.LayoutView
			template: _.template html
			className: 'home-view'
			
			templateHelpers: lang:lang
			
			regions:
				intro:    '.intro'
				box:      '.box'
				provides: '.provides'
				start: 	  '.getStarted'
			
			behaviors:
				FadeBehavior: {}
			
			ui:
				button: 'button.link'
				
			triggers:
				'click @ui.button': 'link:clicked'