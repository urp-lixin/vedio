[@b.head/]
  [@b.grid items=recommends var="recommend"]
    [@b.gridbar]
      bar.addItem("${b.text("action.new")}", action.add());
      bar.addItem("${b.text("action.delete")}", action.remove("确认要删除吗？"));
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="视频栏目" property="video.nav.name"/]
      [@b.col title="视频标题" property="video.name"]<a href="javascript:bg.form.submit(action.getForm(), '${base}/vodback/video/${recommend.video.id}', 'recommend')">${recommend.video.name?html}</a>[/@]
      [@b.col title="视频摄影人" property="video.author"/]
      [@b.col title="视频时长" property="video.second"][#assign s = recommend.video.second/]${(s / 60)?int}分钟${(s % 60 == 0)?string("", (s / 60 - (s / 60)?int) * 60) + "秒"}[/@]
      [@b.col title="视频图片" sortable="false"]<image src="${base}/admin/video/image/${recommend.video.id}" title="${recommend.video.imageName}" width="70" height="70"/>[/@]
      [#--
      [@b.col title="视频" sortable="false"]
        <video src="${base}/vodback/video/video/${recommend.video.id}" width="85" height="85" controls="controls" title="${recommend.video.videoName}"/>
      [/@]
      --]
      [@b.col title="视频发布日期" property="video.publishedAt"]${recommend.video.publishedAt?string("yyyy-MM-dd")}[/@]
      [@b.col title="优先级" property="indexNo" width="50px"/]
    [/@]
  [/@]
[@b.foot/]
