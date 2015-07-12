#
# 404 page
#
define ['App'], (App) ->
	
	App.module 'Error', (Module, a, Backbone, Marionette, $, _) ->
		
		Controller = App.module('Abstract').Controller
		
		class Module.Controller extends Controller
			handlers:
				onShowError: ['module/error/view/Error']
			
			view: null
					
			onShowError: (args) ->
				@view = new Module.ErrorView
				
				@vent.request('layout').getRegion('main').show @view
				@view.triggerMethod 'fade:in'
				
			onDestroyError: ->
				@stopListening @view
				
				promise = $.Deferred()
				@view.triggerMethod 'fade:out', promise
				@view = null
				promise