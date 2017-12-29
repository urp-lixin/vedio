[@b.head title=master.name + "视频点播系统 - 后台管理"]
  <link href="${base}/static/nav/menu.css?v=default" rel="stylesheet" type="text/css" />
  <script src="${base}/static/nav/menu.js" type="text/javascript"></script>
  <link rel="stylesheet" href="${base}/static/bootstrap/css/bootstrap-theme.min.css"/>
  <link rel="stylesheet" href="${base}/static/beangle/css/beangle-ui.css"/>
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
  displayAppAndMenus(apps,menus)
</script>
[@b.foot/]