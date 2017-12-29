package com.yushang.website.vod.core.model

import org.beangle.data.orm.MappingModule

class DefaultMapping extends MappingModule {

  def binding(): Unit = {
    defaultIdGenerator("auto_increment")

    bind[Master]

    bind[Nav]

    bind[Video]

    bind[VideoStat].on(e => declare(
        e.statInfoes is depends("videoStat")))

    bind[VideoStatInfo]

    bind[Wonderful]

    bind[Recommend]
  }
}