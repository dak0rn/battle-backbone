#
# List of features listed in the box section
#
define [
	'App',
	'../model/Feature'
], (app) ->
	
	app.module 'Home', (Module, a, Backbone) ->
		
		class Module.BoxCollection extends app.module('Abstract').Collection
			model: Module.FeatureModel
			endpoint: 'box-features.json'