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
