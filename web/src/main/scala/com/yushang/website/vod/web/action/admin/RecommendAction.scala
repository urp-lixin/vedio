/*
 * OpenURP, Agile University Resource Planning Solution.
 *
 * Copyright © 2005, The OpenURP Software.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.yushang.website.vod.web.action.admin

import org.beangle.commons.collection.{ Collections, Order }
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.mapping
import org.beangle.webmvc.api.view.View
import org.beangle.webmvc.execution.Handler

import com.yushang.website.vod.core.model.{ Nav, Recommend, Video }

class RecommendAction extends VodBackVideoPickedSupport[Recommend] {

  @mapping(value = "new", view = "step1")
  override def editNew(): View = {
    indexSetting
    forward()
  }

  @mapping(value = "video", view = "step2")
  def video(): View = {
    val nav = entityDao.get(classOf[Nav], getId("nav").get.toLong)
    val builder = OqlBuilder.from(classOf[Video], "video")
    builder.where("not exists (from " + entityType.getName + " wonderful where wonderful.video = video)")
    builder.where("video.nav = :nav", nav)
    builder.orderBy(get(Order.OrderStr).orNull).limit(getPageLimit)
    put("videos", entityDao.search(builder))
    put("nav", nav)
    forward()
  }

  @mapping(value = "setting", view = "step3")
  def setting(): View = {
    put("videos", entityDao.find(classOf[Video], longIds("video")))
    forward()
  }

  @mapping(method = "post")
  override def save(): View = {
    val videos = entityDao.find(classOf[Video], longIds("video"))

    val newests = Collections.newBuffer[Recommend]
    for (video <- videos) {
      val recommend = new Recommend
      recommend.indexNo = getInt("indexNo_" + video.id).get
      recommend.video = video
      newests += recommend
    }

    val recommends = Collections.newBuffer[Recommend]
    sortNewest(newests)
    recommends ++= sortOldest(newests, true)

    try {
      saveOrUpdate(recommends)
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
