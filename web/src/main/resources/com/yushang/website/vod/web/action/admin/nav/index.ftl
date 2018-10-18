[@b.head/]
  [@b.toolbar title="栏目管理"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="navs" theme="search"]
          [@b.textfields names="nav.name;名称"/]
        [/@]
      </td>
      <td class="index_content">[@b.div id="navs"/]</td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "navs");
      });
    });
  </script>
[@b.foot/]
