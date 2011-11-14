/***
@title:
Ajax Loader

@version:
1.0

@author:
Andreas Lagerkvist

@date:
2008-09-25

@url:
http://andreaslagerkvist.com/jquery/ajax-loader/

@license:
http://creativecommons.org/licenses/by/3.0/

@copyright:
2008 Andreas Lagerkvist (andreaslagerkvist.com)

@requires:
jquery, jquery.ajaxLoader.css, jquery.ajaxLoader.gif

@does:
Use this plug-in when you want to inform your visitors that a certain part of your page is currently loading. The plug-in adds a faded 'loading-div' on top of the selected element(s). The div is of course completely stylable.

@howto:
jQuery('#contact').ajaxLoader(); would add the overlay on top of the #contact-element.

When you want to remove the loader simply run jQuery('#contact').ajaxLoaderRemove();

@exampleHTML:
I should start loading after a couple of seconds, then load for a couple more and then stop loading only to start again after a couple of seconds. And so on.

@exampleJS:
setInterval(function () {
	jQuery('#jquery-ajax-loader-example').ajaxLoader();
	setTimeout(function () {
		jQuery('#jquery-ajax-loader-example').ajaxLoaderRemove();
	}, 2000);
}, 4000);
***/
jQuery.fn.ajaxLoader=function(a){var b=jQuery.extend({className:"jquery-ajax-loader",fadeDuration:500},a);return this.each(function(){var a=jQuery(this);if(!this.ajaxLoaderObject){var c=a.offset(),d={left:c.left,top:c.top,width:a.outerWidth(),height:a.outerHeight()};this.ajaxLoaderObject=jQuery('<div class="'+b.className+'"></div>').css({position:"absolute",left:d.left+"px",top:d.top+"px",width:d.width+"px",height:d.height+"px"}).appendTo(document.body).hide()}this.ajaxLoaderObject.fadeIn(b.fadeDuration)})},jQuery.fn.ajaxLoaderRemove=function(){return this.each(function(){this.ajaxLoaderObject&&this.ajaxLoaderObject.fadeOut(500)})}