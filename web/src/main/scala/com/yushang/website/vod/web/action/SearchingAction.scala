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
