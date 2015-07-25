#
# Service for the footer
#
define ['App'], (app) ->

	app.module 'Service', (Module, a, Backbone, Marionette, $, _) ->

		# We wait for the start event
		# All required services will be loaded then
		app.vent.once 'start:app', ->
			require ["component/Footer/index"], ->
				Controller = app.module('Footer').Controller
				ctrl = new Controller
				ctrl.triggerMethod 'show:footer'