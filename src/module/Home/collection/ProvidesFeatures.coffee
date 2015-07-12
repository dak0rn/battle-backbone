#
# List of features listed in the "Provides" section
#
define [
	'App',
	'../model/Feature'
], (app) ->
	
	app.module 'Home', (Module, a, Backbone) ->
		
		class Module.ProvidesCollection extends app.module('Abstract').Collection
			model: Module.FeatureModel
			endpoint: 'provides.json'