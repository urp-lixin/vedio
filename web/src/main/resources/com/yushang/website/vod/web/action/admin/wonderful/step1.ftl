[@b.head/]
  [@b.toolbar title="精彩视频-添加-<span style=\"color:blue\">第1步：选择要配置的视频</span>"]
    bar.addBack();
  [/@]
  [@b.grid items=videos var="video"]
    [@b.gridbar]
      bar.addItem("选择添加", function() {
        var ids = bg.input.getCheckBoxValues("video.id");
        if (ids.length == 0 || ids.split(",").length == 0) {
          alert("请选择要添加配置的视频记录。");
          return false;
        }
        
        bg.form.addInput(action.getForm(), "videoIds", ids);
        bg.form.submit(action.getForm(), "${base}/admin/wonderful/setting", "wonderfuls");
      }, "action-new");
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="栏目" property="nav.name"/]
      [@b.col title="标题" property="name"/]
      [@b.col title="摄影人" property="author"/]
      [@b.col title="时长" property="second"][#assign s = video.second/]${(s / 60)?int}分钟${(s % 60 == 0)?string("", (s / 60 - (s / 60)?int) * 60) + "秒"}[/@]
      [@b.col title="图片" sortable="false"]<image src="${base}/admin/video/image/${video.id}" title="${video.imageName}" width="70" height="70"/>[/@]
      [#--
      [@b.col title="视频" sortable="false"]
        <video src="${base}/admin/video/video/${video.id}" width="85" height="85" controls="controls" title="${video.videoName}"/>
      [/@]
      --]
      [@b.col title="发布日期" property="publishedAt"]${video.publishedAt?string("yyyy-MM-dd")}[/@]
      [@b.col title="优先级" property="indexNo" width="50px"/]
    [/@]
  [/@]
[@b.foot/]