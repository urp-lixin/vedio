package com.yushang.website.vod.web.action

import org.beangle.data.dao.{ EntityDao, OqlBuilder }
import org.beangle.webmvc.api.action.ActionSupport
import org.beangle.webmvc.api.view.View

import com.yushang.website.vod.core.model.{ Master, Recommend }

abstract class VodSupport extends ActionSupport {

  var entityDao: EntityDao = _

  def index(): View = {
    indexSetting
    forward()
  }

  protected def indexSetting(): Unit = {
    put("systemId", System.currentTimeMillis())
    put("master", entityDao.getAll(classOf[Master])(0))
  }

  protected def loadRecommends(navId: Option[Long] = None): Unit = {
    navId match {
      case Some(id) =>
        put("recommends", entityDao.search(OqlBuilder.from(classOf[Recommend], "recommend").where("recommend.video.nav.id = :navId", id).orderBy("recommend.indexNo")))
      case None =>
        put("recommends", entityDao.search(OqlBuilder.from(classOf[Recommend], "recommend").orderBy("recommend.indexNo")))
    }
  }
}