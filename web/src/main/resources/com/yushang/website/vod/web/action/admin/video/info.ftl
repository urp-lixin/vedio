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
      <td class="title">来源</td>
      <td class="content">${video.author}</td>
    </tr>
    <tr>
      <td class="title">内容</td>
      <td class="content">${video.description?html}</td>
    </tr>
    <tr>
      <td class="title">图片</td>
      <td class="content">
        <image src="${base}/admin/video/image/${video.id}" onload="this.width = this.width > 200 ? 200 : this.width; this.height = this.height > 200 ? 200 : this.height;"/>
        <div>${video.imageName}</div>
      </td>
    </tr>
    <tr>
      <td class="title">服务器视频名称</td>
      <td class="content">${video.localPath!}</td>
    </tr>
    <tr>
      <td class="title">外部视频地址</td>
      <td class="content">${video.videoUrl!}</td>
    </tr>
    <tr>
      <td class="title">视频网页地址</td>
      <td class="content">${video.wwwUrl!}</td>
    </tr>
    <tr>
      <td class="title">发布日期</td>
      <td class="content">${video.publishedAt?string("yyyy-MM-dd")}</td>
    </tr>
  </table>
[@b.foot/]
