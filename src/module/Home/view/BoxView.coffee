#
# View for a single box
#
define [
	'App',
	'text!./template/Box.html',
	'i18n!../nls/locale'
], (App, html, lang) ->
	
	App.module 'Home', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.BoxView extends Marionette.ItemView
			template: _.template html
			tagName: 'dd'
			className: 'clearfix pos-right'
			
			onRender: ->
				ln = @model.get 'lang'
				
				unless ln?
					return
				
				if ln isnt lang.short
					@$el.addClass 'hide'