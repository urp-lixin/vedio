package com.yushang.website.vod.web

import org.beangle.cdi.bind.BindModule

import com.yushang.website.vod.web.action.{ IndexAction, NavAction, SearchingAction, VideoAction }

class DefaultModule extends BindModule {

  protected override def binding() {
    bind(classOf[IndexAction], classOf[NavAction], classOf[SearchingAction], classOf[VideoAction])
  }
}