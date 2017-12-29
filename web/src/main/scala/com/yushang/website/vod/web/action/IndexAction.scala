package com.yushang.website.vod.web.action

import org.beangle.data.dao.OqlBuilder

import com.yushang.website.vod.core.model.{ Video, Wonderful }

class IndexAction extends VodSupport {
  
  override protected def indexSetting(): Unit = {
    super.indexSetting
    
    put("videos", entityDao.search(OqlBuilder.from(classOf[Video], "video").orderBy("video.publishedAt desc, video.indexNo").limit(1, 11)))
    put("wonderfuls", entityDao.search(OqlBuilder.from(classOf[Wonderful], "wonderful").orderBy("wonderful.indexNo")))
  }
}