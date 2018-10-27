[@b.head/]
  [#include "../videoNav.ftl"/]
  [@b.toolbar title="精彩视频管理"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="wonderfuls" theme="search"]
          [@b.select label="栏目" name="video.nav.id" items=navs?sort_by(["indexNo"]) empty="..."/]
          [@b.textfields names="wonderful.video.name;标题,wonderful.video.author;摄影人,wonderful.video.description;内容"/]
          [@b.datepicker label="发布日期" name="wonderful.video.publishedAt"/]
        [/@]
      </td>
      <td class="index_content">[@b.div id="wonderfuls"/]</td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "wonderfuls");
      });
    });
  </script>
[@b.foot/]
