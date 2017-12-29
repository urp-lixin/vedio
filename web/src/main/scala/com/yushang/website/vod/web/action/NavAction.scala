package com.yushang.website.vod.web.action

import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.{ mapping, param }
import org.beangle.webmvc.api.view.View

import com.yushang.website.vod.core.model.{ Nav, Video }

class NavAction extends VodSupport {

  override protected def indexSetting(): Unit = {
    super.indexSetting
    put("navs", entityDao.getAll(classOf[Nav]))
  }
  
  @mapping("{id}")
  def more(@param("id") id: String): View = {
    super.indexSetting

    val pageNo = get("pageNo") match {
      case Some(pageNo) => pageNo.toInt
      case None         => 1
    }

    val builder = OqlBuilder.from(classOf[Video], "video")
    if ("more" != id) {
      builder.where("video.nav.id = :navId", id.toLong)
    }
    builder.orderBy("video.indexNo")
    builder.limit(pageNo, 15)
    put("videos", entityDao.search(builder))
    
    loadRecommends(if ("more" == id) None else Some(id.toLong))

    forward()
  }
}