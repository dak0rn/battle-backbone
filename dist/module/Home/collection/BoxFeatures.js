var extend=function(t,o){function e(){this.constructor=t}for(var r in o)hasProp.call(o,r)&&(t[r]=o[r]);return e.prototype=o.prototype,t.prototype=new e,t.__super__=o.prototype,t},hasProp={}.hasOwnProperty;define(["App","../model/Feature"],function(t){return t.module("Home",function(o,e,r){return o.BoxCollection=function(t){function e(){return e.__super__.constructor.apply(this,arguments)}return extend(e,t),e.prototype.model=o.FeatureModel,e.prototype.endpoint="box-features.json",e}(t.module("Abstract").Collection)})});