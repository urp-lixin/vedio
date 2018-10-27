[@b.head/]
<script>
beangle.contextPath="${base}"
</script>
  ${b.script("video","js/video.js")}
  [@b.toolbar title="栏目配置"]
    bar.addBack();
  [/@]
  [@b.form name="videoForm" action="!save" target="videos" theme="list"]
    [#assign styleHTML = "width: 200px"/]
    [#if video.persisted]
      [@b.field label="栏目"]<span>${video.nav.name}</span>[/@]
    [#else]
      [@b.select label="栏目" name="video.nav.id" items=navs?sort_by(["indexNo"]) empty="..." value=(video.nav.id)! required="true" style=styleHTML/]
    [/#if]
    [@b.textfield label="标题" name="video.name" value=(video.name)! required="true" maxlength="100" style=styleHTML/]
    [@b.textfield label="摄影人" name="video.author" value=(video.author)! required="true" maxlength="100" style=styleHTML/]
    [@b.textarea label="内容" name="video.description" value=(video.description?html)! required="true" style=styleHTML/]
    [@b.field label="图片" required="true"]
      <table>
        <tr>
        [#if video.persisted]
          <td id="imageNone">
            <image src="${base}/admin/video/image/${video.id}" width="50" height="50"/>
            <div>${video.imageName}</div>
            <input type="hidden" name="video.imageName" value="${video.imageName}"/>
            <input type="hidden" name="video.imageUrl" value="${video.imageUrl}"/>
          </td>
        [/#if]
          <td><input type="file" name="image" accept="image/*"/></td>
          <td><input id="image_" type="hidden"/></td>[#--仅为了验证--]
        </tr>
      </table>
    [/@]
    [@b.validity]
      $("#image_", document.videoForm).assert(function() {
        return document.getElementById("imageNone") && document.getElementById("imageNone").innerHTML;
      }, "请填设图片");
    [/@]
    [@b.textfield label="服务器视频名称" name="video.localPath" value=(video.localPath)! maxlength="1000" style=styleHTML comment="请将该视频放到服务器video文件夹下"/]
    [@b.textfield label="外部视频地址" name="video.videoUrl" value=(video.videoUrl)! maxlength="1000" style=styleHTML/]
    [@b.textfield label="视频网页地址" name="video.wwwUrl" value=(video.wwwUrl)! maxlength="1000" style=styleHTML /]
    [@b.datepicker label="发布日期" name="video.publishedAt" value=(video.publishedAt?string("yyyy-MM-dd"))! required="true" style=styleHTML/]
    [@b.textfield label="优先级" name="video.indexNo" value=(video.indexNo)! required="true" maxlength="100" check="match('integer').greaterThan(0)" style=styleHTML/]
    [@b.formfoot]
      <input type="hidden" name="video.id" value="${video.persisted?string(video.id, "")}"/>
      <input type="submit" value="提交" onclick="/*$('[type=file]').remove();*/bg.form.submit(document.videoForm, null, null, null); return false;"/>
    [/@]
  [/@]
[@b.foot/]
