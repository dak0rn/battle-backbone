#
# Model containing an application feature description
define ['App'], (app) ->
	app.module 'Home', (Module, a, Backbone, Marionette, $, _) ->
		
		class Module.FeatureModel extends Backbone.Model
			defaults:
				title: ''
				description: ''