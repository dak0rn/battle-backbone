#
# Site's navigation
# This module is loaded by the navbar service
#
define [
	'App',
	'text!./template/Navigation.html',
	'css!../css/Navigation.css'
], (app, html) ->
	
	app.module 'Navigation', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.Navigation extends Marionette.ItemView
			template: _.template html
			tagName: 'nav'
			className: 'navbar navbar-inverse navbar-static-top'
			
			behaviors:
				FadeBehavior: {}
				AutoLinkBehavior: {}
			
			ui:
				languageLink: '.language-select'
				
			languages:
				'ln-JS': 'JavaScript'
				'ln-CF': 'CoffeeScript'
				
			events:
				'click @ui.languageLink': 'linkClicked'
				
			# Changes the language to the desired
			# key
			onSetLanguage: (lang) ->
				next = _.first _.without _.keys( @languages ), lang
				
				@ui.languageLink
					.attr 'data-lang-target', next
					.text @languages[next]
						
			# The link in the navigation has been clicked
			# Change the user's language
			linkClicked: (e) ->
				e.preventDefault()
				e.stopPropagation()
				
				lang = @ui.languageLink.attr 'data-lang-target'
				@trigger 'language:selected', lang
				
			onDisplayShield: ->
				@$('.nav-shield').removeClass('hide').addClass 'show-shield'
				
			onHideShield: ->
				@$('.nav-shield').removeClass 'show-shield'