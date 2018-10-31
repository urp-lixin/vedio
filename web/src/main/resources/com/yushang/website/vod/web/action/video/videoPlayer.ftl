[@b.head title=master + "视频点播系统"]
  <meta name="description" content="">
  <meta name="author" content="">
    <script>
    beangle.contextPath="${base}"
  </script>
  ${b.script("video","js/search.js")}
  ${b.script("video","js/nav.js")}
  [#--${b.script("video","js/recommendsEffect.js")}--]
  ${b.script("video","js/videoPlayer.js")}
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
[/@]

[#include "../index/part/head.ftl"/]
[#include "../index/part/nav.ftl"/]
[#include "part/container.ftl"/]
[#include "../index/part/foot.ftl"/]

[@b.foot/]
