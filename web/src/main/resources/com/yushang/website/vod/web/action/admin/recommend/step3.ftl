[@b.head/]
  [@b.toolbar title="精彩视频-添加-<span style=\"color:blue\">第3步：配置已选择的视频</span>"]
    bar.addItem("返回", function () {
      bg.form.submit("searchForm");
    }, "action-backward");
  [/@]
  [@b.form name="recommendThirdStepForm" action="!save" target="recommends" theme="list"]
    [@b.textfield label="111" name="aaa" required="true"/][#--仅为了带出验证--]
      <div class="grid">
        <table class="gridtable">
          <thead class="gridhead">
            <tr>
              <th>视频栏目</th>
              <th>视频名称</th>
              <th>优先级</th>
            </tr>
          </thead>
          <tbody>
          [#assign js_content = ""/]
          [#list videos as video]
            <tr class="${(video_index % 2 == 0)?string("griddata-even", "griddata-odd")}">
              <td>${video.nav.name}</td>
              <td>${video.name}</td>
              <td><input id="indexNo_${video.id}" type="text" name="indexNo_${video.id}" title="优先级" value="" maxlength="100" style="width: 200px; text-align: center"/></td>
            </tr>
            [#assign js]$("#indexNo_${video.id}").require().match("integer").greaterThan(0);[/#assign]
            [#assign js_content = js_content + js/]
          [/#list]
          </tbody>
        </table>
        <div style="margin-top: 10px; color: blue">说明：如果上面所填优先级<br>1.&nbsp;最上方的（即第一条）先排，后面的在前面的基础上进行；<br>2.&nbsp;与已配置优先级相同，则表示所填将优先级优先于它们；<br>3.&nbsp;允许不连续。</div>
      [@b.validity]${js_content}[/@]
      <div style="margin-top: 10px; text-align: center">[@b.submit value="提交"/]</div>
      <input type="hidden" name="videoIds" value="${Parameters["videoIds"]}"/>
    </div>
  [/@]
  <script>
    $(function() {
      $(document).ready(function() {
        $(".grid").appendTo($("form#recommendThirdStepForm"));
        $("fieldset").remove();
      });
    });
  </script>
[@b.foot/]
