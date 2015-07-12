#
# Generic view for documentation contents
#
define [
	'App',
	'i18n!../nls/locale'], (app, locale) ->
	
	app.module 'Docs', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.DocView extends Marionette.ItemView

			vent: null
		
			templateHelpers: ->
					vent: @vent
					lang:locale

			behaviors:
				AutoLinkBehavior:
					selector: 'a.permalink'
					data: 'href'
				FadeBehavior: {}

			events:
				'click .lng-switch': 'changeLanguage'

			initialize: (options) ->
				if options?
					if options.tpl?
						@template = _.template options.tpl
					if options.vent?
						@vent = options.vent

			changeLanguage: (e) ->
				e.preventDefault()
				e.stopPropagation()
				
				$anchor = $ e.target
				lang = $anchor.attr('data-lang')

				if( lang )
					@trigger 'change:language', lang