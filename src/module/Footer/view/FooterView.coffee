#
# View for the footer
#
define [
	'App',
	'text!./template/Footer.html',
	'css!../css/footer.css'
], (App, html) ->
	
	App.module 'Footer', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.FooterView extends Marionette.ItemView
			template: _.template html