var extend=function(t,e){function o(){this.constructor=t}for(var n in e)hasProp.call(e,n)&&(t[n]=e[n]);return o.prototype=e.prototype,t.prototype=new o,t.__super__=e.prototype,t},hasProp={}.hasOwnProperty;define("component/Footer/index",["App"],function(t){return t.module("Footer",function(e,o,n,r,a,s){return e.Controller=function(t){function o(){return o.__super__.constructor.apply(this,arguments)}return extend(o,t),o.prototype.handlers={onShowFooter:["component/Footer/view/FooterView"]},o.prototype.onShowFooter=function(){var t;return t=new e.FooterView,this.vent.request("layout").getRegion("footer").show(t)},o}(t.module("Abstract").Controller)})}),define("text!component/Footer/view/template/Footer.html",[],function(){return'<div class="footer">\n	<div class="container">\n		<div class="clearfix">\n			\n			<div class="footer-logo text-center">\n				<img src="shield.png" class="shield" alt="" />\n				<a href="">battle-backbone</a>\n			</div>\n			\n			<dl class="footer-nav">\n				<dd class="nav-item"><a href="https://65535th.com/battle-backbone">Project page</a></dd>\n				<dd class="nav-item"><a href="https://github.com/dak0rn/generator-battle-backbone">GitHub</a></dd>\n				<dd class="nav-item"><a href="https://npmjs.org/packages/generator-battle-backbone">NPM</a></dd>\n			</dl>\n			\n			<dl class="footer-nav">\n				<dd class="nav-item"><a href="https://github.com/dak0rn/generator-battle-backbone/issues">Issues</a></dd>\n				<dd class="nav-item"><a href="https://github.com/dak0rn/generator-battle-backbone/pulls">Pull requests</a></dd>\n			</dl>\n			\n		</div>\n	</div>\n</div>'}),define("css!component/Footer/css/footer",[],function(){});var extend=function(t,e){function o(){this.constructor=t}for(var n in e)hasProp.call(e,n)&&(t[n]=e[n]);return o.prototype=e.prototype,t.prototype=new o,t.__super__=e.prototype,t},hasProp={}.hasOwnProperty;define("component/Footer/view/FooterView",["App","text!./template/Footer.html","css!../css/footer.css"],function(t,e){return t.module("Footer",function(t,o,n,r,a,s){return t.FooterView=function(t){function o(){return o.__super__.constructor.apply(this,arguments)}return extend(o,t),o.prototype.template=s.template(e),o}(r.ItemView)})}),function(t){var e=document,o="appendChild",n="styleSheet",r=e.createElement("style");r.type="text/css",e.getElementsByTagName("head")[0][o](r),r[n]?r[n].cssText=t:r[o](e.createTextNode(t))}(".footer {\n	margin-top: 3em;\n}\n.footer .shield {\n	max-width: 60px;\n	display: block;\n	margin: 0 auto;\n}\n.footer-logo {\n	height: auto !important;\n}");