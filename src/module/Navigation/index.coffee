#
# Site's navigation
# This module is loaded by the navbar service
#
define [
	'App',
	'./view/Navigation'
], (app) ->
	
	app.module 'Navigation', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.Controller extends app.module('Abstract').Controller
		
			view: null
			
			_handleRoutes: (route, args) ->
				unless 'home' is route
					@view.triggerMethod 'display:shield'
				else
					@view.triggerMethod 'hide:shield'
			
			onShowNavigation: ->
				layout = app.module('Service').layout
				@view  = new Module.Navigation
				
				@listenTo @view, 'language:selected', (language) =>
					@vent.request 'change:language', language
					
				@listenTo @vent, 'route:show', @_handleRoutes, this
				
				layout.getRegion('header').show @view
				
				@view.triggerMethod 'set:language', @vent.request 'language'
				@_handleRoutes @vent.request('route')
				@view.triggerMethod 'fade:in'