package com.yushang.website.vod.core.model

import scala.collection.mutable.Buffer

import org.beangle.commons.collection.Collections
import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.Named

class Nav extends LongId with Named {
  
  var indexNo: Int = _
}