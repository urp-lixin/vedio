[@b.head/]
  [@b.toolbar title="视频配置查看"]
    bar.addBack();
  [/@]
  <style>
    table.infoTable td {
      border-width: 1px;
      border-color: white;
      border-style: solid;
    }
  </style>
  <table class="infoTable">
    <tr>
      <td class="title" width="10%">栏目</td>
      <td class="content">${video.nav.name}</td>
    </tr>
    <tr>
      <td class="title">标题</td>
      <td class="content">${video.name}</td>
    </tr>
    <tr>
      <td class="title">摄影人</td>
      <td class="content">${video.author}</td>
    </tr>
    <tr>
      <td class="title">内容</td>
      <td class="content">${video.description?html}</td>
    </tr>
    <tr>
      <td class="title">时长</td>
      <td class="content">[#assign s = video.second/]${(s / 60)?int}分钟${(s % 60 == 0)?string("", (s / 60 - (s / 60)?int) * 60) + "秒"}</td>
    </tr>
    <tr>
      <td class="title">图片</td>
      <td class="content">
        <image src="${base}/admin/video/image/${video.id}" onload="this.width = this.width > 200 ? 200 : this.width; this.height = this.height > 200 ? 200 : this.height;"/>
        <div>${video.imageName}</div>
      </td>
    </tr>
    <tr>
      <td class="title">视频</td>
      <td class="content">
        <video src="${base}/admin/video/video/${video.id}?v=${systemId}" width="85" height="85" controls="controls" title="${video.videoName}"/>
        <div>${video.videoName}</div>
      </td>
    </tr>
    <tr>
      <td class="title">发布日期</td>
      <td class="content">${video.publishedAt?string("yyyy-MM-dd")}</td>
    </tr>
  </table>
[@b.foot/]