[@b.head/]
  [#include "../videoNav.ftl"/]
  [@b.toolbar title="推荐视频管理"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="recommends" theme="search"]
          [@b.select label="栏目" name="video.nav.id" items=navs?sort_by(["indexNo"]) empty="..."/]
          [@b.textfields names="recommend.video.name;标题,recommend.video.author;摄影人,recommend.video.description;内容"/]
          [@b.datepicker label="发布日期" name="recommend.video.publishedAt"/]
        [/@]
      </td>
      <td class="index_content">[@b.div id="recommends"/]</td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "recommends");
      });
    });
  </script>
[@b.foot/]
