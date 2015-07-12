#
# View with feature boxes
#
define [
	'App',
	'text!./template/Boxes.html',
	'./BoxView'
], (App, html) ->
	
	App.module 'Home', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.BoxesView extends Marionette.CompositeView
			template: _.template html
			childViewContainer: 'dl'
			childView: Module.BoxView
			className: 'boxes-view view-container'
			
			onRenderCollection: ->
				# Move very second child to the left side of the timeline
				@$('dd:not(.hide):odd').removeClass('pos-right').addClass 'pos-left'