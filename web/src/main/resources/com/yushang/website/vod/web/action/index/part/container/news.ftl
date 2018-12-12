      <div class="row">
        <div class="col-md-8 m_b_20">
          <div class="p_relative">
            <a href="${base}/video/${videos[0].id}">
              <img class="img-responsive" src="${base}/video/image/${videos[0].id}" width="100%" alt="">
              <div class="vid_s">${videos[0].name}</div>
            </a>
          </div>
        </div>
        <div class="col-md-4">
          <div class="well p_no">
            <h4 class="news_t">新闻动态</h4>
            <ul class="news_list" style="padding-left: 20px;">
              [#if videos?size gt 1]
                [#list videos as video]
                  [#if video.wwwUrl??]
                    <li><a class="col-xs-8" href="${video.wwwUrl}" style="padding-left: 2px;" target=_blank>${video.name?html}</a><small class="col-xs-4 text-right">${video.publishedAt?string("yyyy-MM-dd")}</small></li>
                  [#else]
                    <li><a class="col-xs-8" href="${base}/video/${video.id}" style="padding-left: 2px;">${video.name?html}</a><small class="col-xs-4 text-right">${video.publishedAt?string("yyyy-MM-dd")}</small></li>
                  [/#if]
                [/#list]
              [/#if]
            </ul>
          </div>
        </div>
      </div>
