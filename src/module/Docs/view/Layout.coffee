#
# Layout view for the documentation
#
define [
	'App',
	'text!./template/Layout.html'], (app, html) ->
	
	app.module 'Docs', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.LayoutView extends Marionette.LayoutView
		
			template: _.template html
			
			behaviors:
				FadeBehavior: {}
				AutoLinkBehavior:
					selector: 'a'
					data: 'href'
				
			regions:
				content: '.content'
				
			onUpdateLinks: (url) ->
				@$("a").removeClass "active"
				@$("a[href='#{url}']").addClass "active"