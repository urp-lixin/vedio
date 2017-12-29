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
            <ul class="news_list">
              [#if videos?size gt 1]
                [#list 1..videos?size - 1 as i]
              <li><a class="col-xs-8" href="${base}/video/${videos[i].id}">${videos[i].name}</a><small class="col-xs-4 text-right">${videos[i].publishedAt?string("yyyy-MM-dd")}</small></li>
                [/#list]
              [/#if]
            </ul>
          </div>
        </div>
      </div>