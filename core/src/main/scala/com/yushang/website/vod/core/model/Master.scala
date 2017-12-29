package com.yushang.website.vod.core.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.Named

class Master extends LongId with Named {
  
  var resourceDir: String = _
}