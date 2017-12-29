package com.yushang.website.vod.web.action

import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.{ mapping, param }
import org.beangle.webmvc.api.view.View

import com.yushang.website.vod.core.model.Video
import java.net.URLDecoder

class SearchingAction extends VodSupport {
  
  @mapping(value = "{key}", view = "list")
  def search(@param("key") key: String): View = {
    super.indexSetting

    val pageNo = get("pageNo") match {
      case Some(pageNo) => pageNo.toInt
      case None         => 1
    }

    val builder = OqlBuilder.from(classOf[Video], "video")
    builder.where("video.name like '%' || :key || '%' or video.description like '%' || :key || '%' or video.author like '%' || :key || '%'", URLDecoder.decode(key, "utf-8"))
    builder.orderBy("video.indexNo")
    builder.limit(pageNo, 15)
    put("videos", entityDao.search(builder))

    loadRecommends()

    forward()
  }
}