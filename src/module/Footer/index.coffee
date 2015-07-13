#
# Application's footer
#
define ['App'], (App) ->
	
	App.module 'Footer', (Module, a, Backbone, Marionette, $, _) ->

		console.log('Footer')
		
		class Module.Controller extends App.module('Abstract').Controller
		
			handlers:
				onShowFooter: ['module/Footer/view/FooterView']
			
			onShowFooter: ->
				view = new Module.FooterView
				
				@vent.request('layout').getRegion('footer').show view