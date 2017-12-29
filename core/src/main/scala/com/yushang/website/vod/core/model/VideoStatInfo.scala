package com.yushang.website.vod.core.model

import org.beangle.data.model.LongId

class VideoStatInfo extends LongId {
  
  var videoStat: VideoStat = _
  
  var ip: String = _
  
  var give: Boolean = false
}