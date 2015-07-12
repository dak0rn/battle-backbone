define ['App'], (App) ->
	
	App.module 'Cookie', (Module, a, Backbone, Marionette, $, _ ) ->

		class Module.CookieController extends App.module('Abstract').Controller

			view: null

			handlers:
				# Function name       Resources to load
				onShowCookies:		['module/Cookie/view/CookieView']

			onShowCookies: ->
				@view = new Module.CookieView

				@listenTo @view, 'navigate', (where) => @vent.request 'navigate', where

				@vent.request('layout').getRegion('main').show @view
				@view.triggerMethod 'fade:in'

			onDestroyCookies: ->
				promise = $.Deferred()

				@view.triggerMethod 'fade:out', promise

				promise