var extend=function(e,t){function o(){this.constructor=e}for(var n in t)hasProp.call(t,n)&&(e[n]=t[n]);return o.prototype=t.prototype,e.prototype=new o,e.__super__=t.prototype,e},hasProp={}.hasOwnProperty;define("module/Docs/index",["App"],function(e){return e.module("Docs",function(t,o,n,r,i,a){return t.Controller=function(e){function o(){return o.__super__.constructor.apply(this,arguments)}return extend(o,e),o.prototype.handlers={onShowDocs:["module/Docs/view/DocView","css!module/Docs/css/docs.css","module/Docs/view/Layout"]},o.prototype._templates={grunt:"Toolchain","":"Intro",core:"Core",modules:"Modules",services:"Services",events:"Events",router:"Router",languages:"Language",rest:"REST","abstract":"Abstracts",loading:"LazyLoading",behaviors:"Behaviors",frameworks:"Frameworks","howto-modules":"howto/Modules"},o.prototype.layout=null,o.prototype.view=null,o.prototype.updateActiveLink=function(){var e;return e=this.vent.request("route:info"),this.layout.triggerMethod("update:links",e.route+"/"+a.first(e.sub))},o.prototype.onShowDocs=function(e){var o,n,r;return n=e[0],r=e[1],n=a.trim(n),null==this._templates[n]?void this.vent.request("navigate","404"):(null==this.layout&&(this.layout=new t.LayoutView,this.vent.request("layout").getRegion("main").show(this.layout),this.layout.triggerMethod("fade:in"),this.updateActiveLink(),this.listenTo(this.vent,"route:show",this.updateActiveLink,this)),o=i.Deferred(),require(["text!module/Docs/view/template/"+this._templates[n]+".html"],function(e){return function(i){var a;return e.view=new t.DocView({tpl:i,vent:e.vent}),e.vent.request("change:title","Documentation - battle-backbone"),e.layout.getRegion("content").show(e.view),e.view.triggerMethod("fade:in",o),e.listenTo(e.view,"change:language",function(t){return e.vent.request("change:language",t)}),a=function(){return null!=r?e.vent.request("scroll:element",".ln-"+r):""!==n?e.vent.request("scroll:element",".content"):void 0},setTimeout(a,200)}}(this)),o)},o.prototype.onDestroyDocs=function(e){var t;return null!=this.view&&"docs"===e?(t=i.Deferred(),this.view.triggerMethod("fade:out",t),t):(this.stopListening(this.vent,"route:show"),null!=this.layout?(t=i.Deferred(),this.stopListening(this.layout),this.layout.triggerMethod("fade:out",t),this.layout=null,t):void 0)},o}(e.module("Abstract").Controller)})}),define("module/Docs/nls/ln-CF/locale",{lang:"CoffeeScript","short":"cs",appfile:"App.coffee",ext:"coffee",config_request:'config = @vent.request "config"',module_code:"define ['App'], (App) ->\n    App.module 'ModuleName', (Module, application, Backbone, Marionette, $, _) ->\n        // Code"}),define("module/Docs/nls/ln-JS/locale",{lang:"JavaScript","short":"js",appfile:"App.js",ext:"js",config_request:'var config = this.vent.request("config");',module_code:"define(['App'], function(App) {\n    App.module('ModuleName',function(Module, application, Backbone, Marionette, $, _) {\n        // Code\n    });\n};"}),define("module/Docs/nls/locale",{"ln-JS":!0,"ln-CF":!0});var extend=function(e,t){function o(){this.constructor=e}for(var n in t)hasProp.call(t,n)&&(e[n]=t[n]);return o.prototype=t.prototype,e.prototype=new o,e.__super__=t.prototype,e},hasProp={}.hasOwnProperty;define("module/Docs/view/DocView",["App","i18n!../nls/locale"],function(e,t){return e.module("Docs",function(e,o,n,r,i,a){return e.DocView=function(e){function o(){return o.__super__.constructor.apply(this,arguments)}return extend(o,e),o.prototype.vent=null,o.prototype.templateHelpers=function(){return{vent:this.vent,lang:t}},o.prototype.behaviors={AutoLinkBehavior:{selector:"a.permalink",data:"href"},FadeBehavior:{}},o.prototype.events={"click .lng-switch":"changeLanguage"},o.prototype.initialize=function(e){return null!=e&&(null!=e.tpl&&(this.template=a.template(e.tpl)),null!=e.vent)?this.vent=e.vent:void 0},o.prototype.changeLanguage=function(e){var t,o;return e.preventDefault(),e.stopPropagation(),t=i(e.target),o=t.attr("data-lang"),o?this.trigger("change:language",o):void 0},o}(r.ItemView)})}),define("text!module/Docs/view/template/Layout.html",[],function(){return'<div class="gray-header doc-header">\n	\n	\n	<div class="container">\n		<h1><a href="docs/">battle-backbone</a> <small>documentation</small></h1>\n			\n		<div class="row">\n			<div class="col-sm-3">\n				<h3>battle-backbone</h3>\n				\n				<ul>\n					<li><a href="docs/core">Core</a></li>\n					<li><a href="docs/modules">Modules</a></li>\n					<li><a href="docs/services">Services</a></li>\n					<li><a href="docs/grunt">Toolchain</a></li>\n					<li><a href="docs/events">Events and requests</a></li>\n					<li><a href="docs/frameworks">Third-party components</a></li>\n				</ul>\n			</div>\n			\n			<div class="col-sm-3">\n				<h3>Components</h3>\n				<ul>\n					<li><a href="docs/router">Routing</a></li>\n					<li><a href="docs/languages">Multi-language support</a></li>\n					<li><a href="docs/abstract/rest">REST API integration</a></li>\n					<li><a href="docs/loading">Lazy loading</a></li>\n					<li><a href="docs/behaviors">Behaviors</a></li>\n					<li><a href="docs/abstract">Abstract classes</a></li>\n				</ul>\n			</div>\n			\n			<div class="col-sm-3">\n				<h3>Guides</h3>\n				<ul>\n					<li><a href="docs/howto-modules">How to write modules</a></li>\n					<li><a href="docs/services/structure">How to write services</a></li>\n				</ul>\n			</div>\n			\n		</div>\n	</div>\n	\n	\n</div>\n<div class="content"></div>'});var extend=function(e,t){function o(){this.constructor=e}for(var n in t)hasProp.call(t,n)&&(e[n]=t[n]);return o.prototype=t.prototype,e.prototype=new o,e.__super__=t.prototype,e},hasProp={}.hasOwnProperty;define("module/Docs/view/Layout",["App","text!./template/Layout.html"],function(e,t){return e.module("Docs",function(e,o,n,r,i,a){return e.LayoutView=function(e){function o(){return o.__super__.constructor.apply(this,arguments)}return extend(o,e),o.prototype.template=a.template(t),o.prototype.behaviors={FadeBehavior:{},AutoLinkBehavior:{selector:"a",data:"href"}},o.prototype.regions={content:".content"},o.prototype.onUpdateLinks=function(e){return this.$("a").removeClass("active"),this.$("a[href='"+e+"']").addClass("active")},o}(r.LayoutView)})});