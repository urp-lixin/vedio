package com.yushang.website.vod.web.action.admin

import org.beangle.commons.collection.{ Collections, Order }
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.mapping
import org.beangle.webmvc.api.view.View
import org.beangle.webmvc.execution.Handler

import com.yushang.website.vod.core.model.{ Video, Wonderful }

class WonderfulAction extends VodBackVideoPickedSupport[Wonderful] {

  @mapping(value = "new", view = "step1")
  override def editNew(): View = {
    val builder = OqlBuilder.from(classOf[Video], "video")
    builder.where("not exists (from " + entityType.getName + " wonderful where wonderful.video = video)")
    builder.orderBy(get(Order.OrderStr).orNull).limit(getPageLimit)
    put("videos", entityDao.search(builder))
    forward()
  }

  @mapping(value = "setting", view = "step2")
  def setting(): View = {
    put("videos", entityDao.find(classOf[Video], longIds("video")))
    forward()
  }

  @mapping(method = "post")
  override def save(): View = {
    val videos = entityDao.find(classOf[Video], longIds("video"))

    val newests = Collections.newBuffer[Wonderful]
    for (video <- videos) {
      val wonderful = new Wonderful
      wonderful.indexNo = getInt("indexNo_" + video.id).get
      wonderful.video = video
      newests += wonderful
    }

    val wonderfuls = Collections.newBuffer[Wonderful]
    sortNewest(newests)
    wonderfuls ++= sortOldest(newests)

    try {
      saveOrUpdate(wonderfuls)
      redirect("search", "info.save.success")
    } catch {
      case e: Exception => {
        val redirectTo = Handler.mapping.method.getName match {
          case "save"   => "editNew"
          case "update" => "edit"
        }
        logger.info("saveAndRedirect failure", e)
        redirect(redirectTo, "info.save.failure")
      }
    }
  }
}