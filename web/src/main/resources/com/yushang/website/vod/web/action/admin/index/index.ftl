[@b.head title=master.name + "视频点播系统 - 后台管理"]
  ${b.css("video","nav/menu.css")}


  <style>
    body, body * {
      font-size: 13px;
    }
  </style>
[/@]

[#include "../nav.ftl"/]
[@displayFrame appName="website-vod-admin" /]

<script type="text/javascript">
  var menus = [{id:1,title:'栏目',entry:'/admin/nav',code:'01'},
    {id:2,title:'视频',entry:'/admin/video',code:'02'}]
  var webappBase='';
  thisAppName='website-vod-admin'
  var apps = [{name:'website-vod-admin',title:'基础数据配置',url:'/admin/index'}]

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
        appendHtml = appendHtml.replace('{menu.entry}','${base}'+menu.entry);
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

  displayAppAndMenus(apps,menus);
</script>
[@b.foot/]
