
[#macro displayFrame appName mainHref="" fixed=true]
<nav style="margin-top: -20px; margin-bottom: 0px" role="navigation" class="navbar navbar-default">
  <div class="navbar-header">
    <img src="${b.static_url('video','images/logo_back.png')}" style="width:50px;height:50px;float: left !important;"/>
    <a onclick="return bg.Go(this,null)" style="height: 20px;" class="navbar-brand" href="${base}/admin/index">${master.name}视频点播系统&nbsp;-&nbsp;后台管理</a>
  </div>
  <div>
    <ul class="nav navbar-nav" style="height: 50px;" id="app_nav_bar"></ul>
    <ul class="nav navbar-nav navbar-right" style="height: 35px; padding-top: 15px;">
      <li>[#nested/]</li>
      <li>
        <span class="glyphicon glyphicon-user" aria-hidden="true">[@b.a href="/security/my" target="_blank" title="我的账户"]管理员[/@]</span>
        <span class="glyphicon glyphicon-log-out" aria-hidden="true">退出&nbsp;&nbsp;</span>
      </li>
    </ul>
  </div>
</nav>

<table id="mainTable" style="width:100%;">
  <tr>
    <td style="height:100%;width:10%;padding-right: 0px;" id="leftTD" valign="top">
      <div id="menu_panel" ><ul class="menu collapsible" id="menu_ul"></ul></div>
    </td>
    <td style="height:100%;width:5px">
      <div id="_menu_folder"><div id="_menu_folder_tri"></div></div>
    </td>
    <td id="rightTD" valign="top" style="padding-left: 0px;">
      [@b.div id="main" href="nav"/]
    </td>
  </tr>
</table>
[/#macro]
