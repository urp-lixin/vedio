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

import org.beangle.commons.collection.Collections
import org.beangle.commons.lang.Strings
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.param
import org.beangle.webmvc.api.view.View
import org.beangle.webmvc.execution.Handler

import com.yushang.website.vod.core.model.Nav

class NavAction extends VodBackSupport[Nav] {

  def checkAjax(@param("id") id: String, @param("name") name: String): View = {
    val builder = OqlBuilder.from(classOf[Nav], simpleEntityName)
    Strings.isBlank(id) match {
      case true  =>
      case false => builder.where(simpleEntityName + ".id != :id", id.toLong)
    }
    builder.where(simpleEntityName + ".name = :name", name.trim)
    put("isOk", entityDao.search(builder).isEmpty)
    forward()
  }

  override protected def saveAndRedirect(nav: Nav): View = {
    try {
      val builder = OqlBuilder.from(classOf[Nav], simpleEntityName)
      nav.persisted match {
        case true  => builder.where(simpleEntityName + ".id != :id", nav.id)
        case false =>
      }
      builder.where(simpleEntityName + ".indexNo >= :indexNo", nav.indexNo)
      builder.orderBy(simpleEntityName + ".indexNo")
      val navs = entityDao.search(builder)
      val results = !navs.isEmpty && navs(0).indexNo == nav.indexNo match {
        case true =>
          var i = 0
          var indexNo = nav.indexNo
          for (i <- 0 until navs.size if indexNo == navs(i).indexNo) {
            navs(i).indexNo += 1
                indexNo += 1
          }
          Collections.newBuffer[Nav] ++ navs
        case false => Collections.newBuffer[Nav](nav)
      }
      results += nav
      saveOrUpdate(results)
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
