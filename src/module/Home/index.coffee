#
# Module for the homepage
#
define ['App'], (App) ->
	
	App.module 'Home', (Module, a, Backbone, Marionette, $, _) ->
		
		Controller = App.module('Abstract').Controller
		
		class Module.Controller extends Controller
		
			# Resources to be load before the function is invoked
			handlers:
				onShowHome: [
					'module/Home/view/HomeLayout',
					'module/Home/view/IntroView',
					'module/Home/view/BoxesView',
					'module/Home/view/ProvidesView',
					'module/Home/view/GetStartedView',
					
					'module/Home/collection/BoxFeatures',
					'module/Home/collection/ProvidesFeatures'
				]
				
			layout: null
					
			# Invoked when the route 'home' is displayed
			# Configured in the configuration file
			# Loads th
			onShowHome: ->
				
				# Main layout
				@layout = new Module.HomeLayout
				
				
				# What's in the box?
				boxCollection = new Module.BoxCollection
				boxPromise    = boxCollection.fetch()
				
				providesCollection = new Module.ProvidesCollection
				providesPromise = providesCollection.fetch()
				
				
				# Sub views
				introView = new Module.IntroView
				boxesView = new Module.BoxesView collection:boxCollection
				providesView = new Module.ProvidesView collection:providesCollection
				startView = new Module.GetStartedView
				
				@listenTo @layout, 'link:clicked', => @vent.request 'navigate', '404'
				
				@vent.request('layout').getRegion('main').show @layout

				promise = $.Deferred()
				
				$.when(boxPromise, providesPromise).done =>
					
					# Render sub views
					@layout.getRegion('intro').show introView
					@layout.getRegion('box').show boxesView
					@layout.getRegion('provides').show providesView
					@layout.getRegion('start').show startView
					
					@vent.request 'change:title', 'battle-backbone' 
					@layout.triggerMethod 'fade:in', promise
					
					# A bit memory friendly
					boxCollection = providesCollection = null
					introView = boxesView = providesView = null
					boxPromise = providesPromise = null

				promise
			
			# Invoked when the route 'home' is changed	
			onDestroyHome: ->
				@stopListening @layout
				
				promise = $.Deferred()
				@layout.triggerMethod 'fade:out', promise
				
				@layout = null
				
				promise
