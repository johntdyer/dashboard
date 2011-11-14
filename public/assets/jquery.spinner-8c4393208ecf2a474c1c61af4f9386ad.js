/*
    Spinner provides a simple approach for adding and removing a preloader
    for your web applications. Usage is as simple as calling $('elem').spinner() and
    subsequently $('elem').spinner.remove(). You may create your own preloader
    at http://www.ajaxload.info. Please note that if you use a custom preloader,
    you must pass in the new height and width as options.
    
    Copyright (C) 2010 Corey Ballou
    Website: http://www.jqueryin.com
    Documentation: http://www.jqueryin.com/projects/spinner-jquery-preloader-plugin/

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */
(function(a){a.fn.spinner=function(b){var c=a.extend({},a.fn.spinner.defaults,b);return this.each(function(){var d=0,e=0,f=0,g=0,h=0,i,j=a(this);if(b=="remove"||b=="close"){var i=j.data("spinner"),k=j.data("opts");if(typeof i!="undefined"){i.remove(),j.removeData("spinner").removeData("opts"),k.hide&&j.css("visibility","visible"),k.onFinish.call(this);return}}var l=j.offset();f=j.outerWidth(),g=j.outerHeight(),g>c.height?h=Math.round((g-c.height)/2):g<c.height&&(h=0-Math.round((c.height-g)/2)),e=l.top+h+"px",c.position=="right"?d=l.left+f+10+"px":c.position=="left"?d=l.left-c.width-10+"px":d=l.left+Math.round(.5*f)-Math.round(.5*c.width)+"px",c.onStart.call(this),c.hide&&j.css("visibility","hidden"),i=a('<img src="'+c.img+'" style="position: absolute; left: '+d+"; top: "+e+"; width: "+c.width+"px; height: "+c.height+"px; z-index: "+c.zIndex+';" />').appendTo("body"),j.data("spinner",i).data("opts",c)})},a.fn.spinner.defaults={position:"right",img:"assets/spinners/spinner.gif",height:16,width:16,zIndex:1001,hide:!1,onStart:function(){},onFinish:function(){}}})(jQuery)