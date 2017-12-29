package com.yushang.website.vod.core.model

import scala.collection.mutable.Set
import scala.util.control.Breaks.{ break, breakable }

import org.beangle.commons.collection.Collections
import org.beangle.data.model.LongId
import scala.collection.mutable.Buffer

class VideoStat extends LongId {

  var video: Video = _

  var statInfoes: Buffer[VideoStatInfo] = Collections.newBuffer[VideoStatInfo]

  var good: Int = _

  var bad: Int = _

  def addIp(ipAddr: String): Unit = {
    val statInfo = new VideoStatInfo
    statInfo.videoStat = this
    statInfo.ip = ipAddr
    statInfoes += statInfo
  }

  def info(ip: String): VideoStatInfo = {
    var result: VideoStatInfo = null
    breakable {
      for (statInfo <- statInfoes) {
        if (statInfo.ip == ip) {
          result = statInfo
          break
        }
      }
    }
    result
  }
}