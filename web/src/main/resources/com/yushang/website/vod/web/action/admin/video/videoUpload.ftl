<video width="100" height="100" controls="controls" autoplay="autoplay">
  <source src="${base}/admin/video/videoPreview/${videoUrl}?videoName=${videoName}"/>
</video>
<div>${videoName}</div>
<input type="hidden" name="video.videoName" value="${videoName}"/>
<input type="hidden" name="video.videoUrl" value="${videoUrl}"/>
