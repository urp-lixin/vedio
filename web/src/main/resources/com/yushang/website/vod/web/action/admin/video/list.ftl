[@b.head/]
  [@b.grid items=videos var="video"]
    [@b.gridbar]
      bar.addItem("${b.text("action.new")}", action.add());
      bar.addItem("${b.text("action.modify")}", action.edit());
      bar.addItem("${b.text("action.delete")}", action.remove("确认要删除吗？"));
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="栏目" property="nav.name"/]
      [@b.col title="标题" property="name"]<a href="javascript:bg.form.submit(action.getForm(), '${base}/admin/video/${video.id}', 'videos')">${video.name?html}</a>[/@]
      [@b.col title="摄影人" property="author"/]
      [@b.col title="图片" sortable="false"]<image src="${base}/admin/video/image/${video.id}" title="${video.imageName}" width="70" height="70"/>[/@]
      [@b.col title="发布日期" property="publishedAt"]${video.publishedAt?string("yyyy-MM-dd")}[/@]
      [@b.col title="优先级" property="indexNo" width="50px"/]
    [/@]
  [/@]
[@b.foot/]
