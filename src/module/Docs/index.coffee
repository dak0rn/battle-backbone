# 
# Controller for the documentation
#
define ['App'], (App) ->
	
	App.module 'Docs', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.Controller extends App.module('Abstract').Controller
		
			handlers:
				onShowDocs: [
					'module/Docs/view/DocView'
					'css!module/Docs/css/docs.css',
					'module/Docs/view/Layout'
				]

			_templates: 
				"grunt": "Toolchain"
				"": "Intro"
				"core": "Core"
				"modules": "Modules"
				"services": "Services"
				"events": "Events"
				"router": "Router"
				"languages": "Language"
				"rest": "REST"
				"abstract": "Abstracts"
				"loading": "LazyLoading"
				"behaviors": "Behaviors"
				"frameworks": "Frameworks"
				"howto-modules": "howto/Modules"
				
			# Page layout
			layout: null
			
			# Current sub view
			view: null
			
			updateActiveLink: ->
				ri  = @vent.request 'route:info'
				@layout.triggerMethod 'update:links', "#{ri.route}/#{_.first ri.sub}"
		
			# Displays the documentation
			onShowDocs: (args) ->

				route = args[0]
				subroute = args[1]
				route = _.trim route
				
				# No doc found? return
				unless @_templates[route]?
					@vent.request 'navigate', '404'
					return
					
				# Create a layout if we do not already have one
				unless @layout?
					@layout = new Module.LayoutView
					@vent.request('layout').getRegion('main').show @layout
					@layout.triggerMethod 'fade:in'
					
					# If we create the layout this is the first time
					# the route has been invoked. Thus, we do not listen
					# for any route events yet. Let's change that now.
					@updateActiveLink()
					@listenTo @vent, 'route:show', @updateActiveLink, this

				promise = $.Deferred()
				
				# Dynamically load the required template
				require ["text!module/Docs/view/template/#{@_templates[route]}.html"], (html) =>

					# Create a new view and pass the loaded template markup
					@view = new Module.DocView(
						tpl:html
						vent:@vent
					)
					
					# Change the title
					@vent.request 'change:title', 'Documentation - battle-backbone'
					
					# Display the view
					@layout.getRegion('content').show @view
					
					@view.triggerMethod 'fade:in', promise

					@listenTo @view, 'change:language', (lang) => @vent.request 'change:language', lang

					fn = =>
						# If a subroute is given we scroll to the referenced
						# paragraph
						if subroute?
							@vent.request 'scroll:element', ".ln-#{subroute}"
						# If not, scroll to the beginning of the content
						# But not if the route is empty -> we do not want to scroll
						# down on the doc's home page
						else if '' isnt route 
							@vent.request 'scroll:element', '.content'
							
					# Wait a bit so that resources can be loaded
					setTimeout fn, 200

				# Return the fade promise
				promise
				
			
			# Destroy the documentation
			onDestroyDocs: (next) ->
			
				# Do we have a view?
				if @view?
					# Next page still within the docs?
					# In that case we only hide the view below the navigation
					if 'docs' is next
						promise = $.Deferred()
						@view.triggerMethod 'fade:out', promise
					
						return promise
				
				@stopListening @vent, 'route:show'
				
				if @layout?
					promise = $.Deferred()

					@stopListening @layout
					@layout.triggerMethod 'fade:out', promise
					
					@layout = null
					
					return promise
				