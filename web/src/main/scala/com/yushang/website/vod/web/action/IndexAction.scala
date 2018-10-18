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

import com.yushang.website.vod.core.model.{ Video, Wonderful }

class IndexAction extends VodSupport {

  override protected def indexSetting(): Unit = {
    super.indexSetting

    put("videos", entityDao.search(OqlBuilder.from(classOf[Video], "video").orderBy("video.publishedAt desc, video.indexNo").limit(1, 11)))
    put("wonderfuls", entityDao.search(OqlBuilder.from(classOf[Wonderful], "wonderful").orderBy("wonderful.indexNo")))
  }
}
