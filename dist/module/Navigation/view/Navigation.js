var extend=function(t,e){function a(){this.constructor=t}for(var n in e)hasProp.call(e,n)&&(t[n]=e[n]);return a.prototype=e.prototype,t.prototype=new a,t.__super__=e.prototype,t},hasProp={}.hasOwnProperty;define(["App","text!./template/Navigation.html","css!../css/Navigation.css"],function(t,e){return t.module("Navigation",function(t,a,n,o,r,i){return t.Navigation=function(t){function a(){return a.__super__.constructor.apply(this,arguments)}return extend(a,t),a.prototype.template=i.template(e),a.prototype.tagName="nav",a.prototype.className="navbar navbar-inverse navbar-static-top",a.prototype.behaviors={FadeBehavior:{},AutoLinkBehavior:{}},a.prototype.ui={languageLink:".language-select"},a.prototype.languages={"ln-JS":"JavaScript","ln-CF":"CoffeeScript"},a.prototype.events={"click @ui.languageLink":"linkClicked"},a.prototype.onSetLanguage=function(t){var e;return e=i.first(i.without(i.keys(this.languages),t)),this.ui.languageLink.attr("data-lang-target",e).text(this.languages[e])},a.prototype.linkClicked=function(t){var e;return t.preventDefault(),t.stopPropagation(),e=this.ui.languageLink.attr("data-lang-target"),this.trigger("language:selected",e)},a.prototype.onDisplayShield=function(){return this.$(".nav-shield").removeClass("hide").addClass("show-shield")},a.prototype.onHideShield=function(){return this.$(".nav-shield").removeClass("show-shield")},a}(o.ItemView)})});