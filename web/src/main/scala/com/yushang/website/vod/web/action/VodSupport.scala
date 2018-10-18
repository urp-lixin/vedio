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
