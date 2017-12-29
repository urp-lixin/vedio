/* 
Simple JQuery menu.
HTML structure to use:

Notes: 

Each menu MUST have a class 'menu' set. If the menu doesn't have this, the JS won't make it dynamic
If you want a panel to be expanded at page load, give the containing LI element the classname 'expand'.
Use this to set the right state in your page (generation) code.

Optional extra classnames for the UL element that holds an accordion:

noaccordion : no accordion functionality
collapsible : menu works like an accordion but can be fully collapsed

<ul class="menu [optional class] [optional class]">
<li><a href="#">Sub menu heading</a>
<ul>
<li><a href="http://site.com/">Link</a></li>
<li><a href="http://site.com/">Link</a></li>
<li><a href="http://site.com/">Link</a></li>
...
...
</ul>
// This item is open at page load time
<li class="expand"><a href="#">Sub menu heading</a>
<ul>
<li><a href="http://site.com/">Link</a></li>
<li><a href="http://site.com/">Link</a></li>
<li><a href="http://site.com/">Link</a></li>
...
...
</ul>
...
...
</ul>

Copyright 2007-2010 by Marco van Hylckama Vlieg

web: http://www.i-marco.nl/weblog/
email: marco@i-marco.nl

Free to use any way you like.
*/

		



jQuery.fn.initMenu = function() {  
    return this.each(function(){
        var theMenu = $(this).get(0);
        $('.acitem', this).hide();
        $('li.expand > .acitem', this).show();
        $('li.expand > .acitem', this).prev().addClass('active');
        $('li a', this).click(
            function(e) {
                e.stopImmediatePropagation();
                var theElement = $(this).next();
                var parent = this.parentNode.parentNode;
				//alert(parent);
                if($(parent).hasClass('noaccordion')) {
                    if(theElement[0] === undefined) {
                        window.location.href = this.href;
                    }
                    $(theElement).slideToggle('normal', function() {
                        if ($(this).is(':visible')) {
                            $(this).prev().addClass('active');
							
                        }
                        else {
                            $(this).prev().removeClass('active');
                        }    
                    });
                    return false;
                }
                else {
                    if(theElement.hasClass('acitem') && theElement.is(':visible')) {
                        if($(parent).hasClass('collapsible') || $(parent).hasClass('scroll_box')) {
                            $('.acitem:visible', parent).first().slideUp('normal', 
                            function() {
                                $(this).prev().removeClass('active');
								//alert('1');
                            }
							
                        );
                        return false;  
                    }
                    return false;
                }
                if(theElement.hasClass('acitem') && !theElement.is(':visible')) {         
                    $('.acitem:visible', parent).first().slideUp('normal', function() {
                        $(this).prev().removeClass('active');
						//alert('1');
                    });
                    theElement.slideDown('normal', function() {
                        $(this).prev().addClass('active');
                    });
                    return false;
                }
            }
        }
    );
});
};

 $(document).ready(function() {
    $('.menu').initMenu();
});

  var foldTemplate='<li style="margin:0px;" class="{active_class}"><a href="javascript:void(0)" class="first_menu">{menu.title}</a><ul class="acitem" style="display: none;"><div class="scroll_box" id="menu{menu.id}"></div></ul></li>'
  var menuTempalte='<li><a class="p_1" onclick="return bg.Go(this,\'main\')" href="{menu.entry}">{menu.title}</a></li>';
  var appTemplate='<li class="{active_class}"><a href="{app.url}" target="_top">{app.title}</a></li>';
  function addApps(apps,jqueryElem){
    var appendHtml='';
    for(var i=0;i<apps.length;i++){
      var app = apps[i];
      appendHtml = appTemplate.replace('{app.url}',app.url.replace('{openurp.webapp}',webappBase));
      appendHtml = appendHtml.replace('{app.title}',app.title);
      appendHtml = appendHtml.replace('{active_class}',app.name==thisAppName?"active":"");
      jqueryElem.append(appendHtml);
    }
  }

  function addMenus(menus,jqueryElem){
    var appendHtml='';
    for(var i=0;i<menus.length;i++){
      var menu = menus[i];
      if(menu.children){
        appendHtml = foldTemplate.replace('{menu.id}',menu.id);
        appendHtml = appendHtml.replace('{menu.title}',menu.title);
        appendHtml = appendHtml.replace('{active_class}',(i==0)?"expand":"");
        jqueryElem.append(appendHtml);
        addMenus(menu.children,jQuery('#menu'+menu.id));
      }else{
        appendHtml = menuTempalte.replace('{menu.id}',menu.id);
        appendHtml = appendHtml.replace('{menu.title}',menu.title);
        appendHtml = appendHtml.replace('{menu.entry}',bg.getContextPath()+menu.entry);
        jqueryElem.append(appendHtml);
      }
    }
  }

  function displayAppAndMenus(apps,menus){
    addApps(apps,jQuery('#app_nav_bar'));
    addMenus(menus,jQuery('#menu_ul'));
  
    jQuery(function() {
        jQuery("ul.menu li a.p_1").click(function() {
          jQuery("ul.menu li.current").removeClass('current');
          jQuery(this).parent('li').addClass('current');
        });
        jQuery('#_menu_folder_tri').addClass('arrow-left');
        jQuery('#_menu_folder').click(function() {
            jQuery('#leftTD').toggle(200);
            var jq_tri = jQuery('#_menu_folder_tri');
            if(jq_tri.hasClass('arrow-left')) {
                jq_tri.removeClass('arrow-left');
                jq_tri.addClass('arrow-right');
            } else {
                jq_tri.removeClass('arrow-right');
                jq_tri.addClass('arrow-left');
            }
        });
    });
  }
