#
# View with information panels
#
define [
	'App',
	'text!./template/Panels.html',
	'./ProvidesBoxView'
], (App, html) ->
	
	App.module 'Home', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.ProvidesView extends Marionette.CompositeView
			
			template: _.template html
			className: 'panels-view view-container'
			
			childView: Module.ProvidesBox
			childViewContainer: '.panels'
			
			behaviors:
				AutoLinkBehavior: {}