package com.yushang.website.vod.web.action.admin

import org.beangle.cdi.bind.BindModule

class DefaultModule extends BindModule {

  protected override def binding() {
    bind(classOf[IndexAction], classOf[NavAction], classOf[VideoAction], classOf[WonderfulAction], classOf[RecommendAction])
  }
}