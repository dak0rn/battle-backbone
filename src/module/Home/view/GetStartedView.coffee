# View for the 'Get started' section
define ['App', 'text!./template/GetStarted.html','i18n!../nls/locale'], (app, html, lang) ->
	
	app.module 'Home', (Module, a, Backbone, Marionette, $, _ ) ->
		
		class Module.GetStartedView extends Marionette.ItemView
			template: _.template html
			className: 'view-container start-view'
			
			# Provide the localization to the template as `lang`
			templateHelpers: lang:lang
			
			behaviors:
				AutoLinkBehavior: {}