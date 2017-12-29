package com.yushang.website.vod.core.model

import java.util.Date

import org.beangle.data.model.pojo.Named

import com.yushang.website.vod.core.VideoIndexNo

class Video extends VideoIndexNo with Named {

  var author: String = _

  var description: String = _

  var second: Int = _

  var imageName: String = _

  var imageUrl: String = _

  var videoName: String = _
  
  var videoUrl: String = _

  var publishedAt: Date = _

  var nav: Nav = _
}