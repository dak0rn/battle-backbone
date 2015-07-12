define ['App', 'text!./template/CookieView.html'], (App, html) ->
	
	App.module 'Cookie', (Module, a, Backbone, Marionette, $, _ ) ->

		class Module.CookieView extends Marionette.ItemView
			template: _.template html

			ui:
				'navigateButton': '.submit'
				'routeInput': '.route'

			events:
				'click @ui.navigateButton': 'navigate'

			behaviors:
				FadeBehavior: {}

			navigate: (e) ->
				e.preventDefault()
				e.stopPropagation()

				route = @ui.routeInput.val()

				@trigger 'navigate', route unless '' is route