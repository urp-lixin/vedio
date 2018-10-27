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
[/@]

[#include "../index/part/head.ftl"/]
[#include "../index/part/nav.ftl"/]
[#include "part/container.ftl"/]
[#include "../index/part/foot.ftl"/]

[@b.foot/]
