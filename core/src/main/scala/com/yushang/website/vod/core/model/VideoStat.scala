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
package com.yushang.website.vod.core.model

import scala.collection.mutable.Set
import scala.util.control.Breaks.{ break, breakable }

import org.beangle.commons.collection.Collections
import org.beangle.data.model.LongId
import scala.collection.mutable.Buffer

class VideoStat extends LongId {

  var video: Video = _

//  var statInfoes: Buffer[VideoStatInfo] = Collections.newBuffer[VideoStatInfo]

  var good: Int = _

  var bad: Int = _

  var views: Int = _

//  def addIp(ipAddr: String): Unit = {
//    val statInfo = new VideoStatInfo
//    statInfo.videoStat = this
//    statInfo.ip = ipAddr
//    statInfoes += statInfo
//  }
//
//  def info(ip: String): VideoStatInfo = {
//    var result: VideoStatInfo = null
//    breakable {
//      for (statInfo <- statInfoes) {
//        if (statInfo.ip == ip) {
//          result = statInfo
//          break
//        }
//      }
//    }
//    result
//  }
}
