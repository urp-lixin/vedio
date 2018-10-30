        <div class="col-md-9 m_b_20">
          <h4 class="page-header c_warning">
            <span class="span_t"><img class="m_r_5" src="${b.static_url("video","images/news.png")}">${nav.name}</span>
          </h4>
          <div class="xw_list">
            <ul>
            [#list videos as video]
              [#if video.wwwUrl??]
                <li><a class="col-xs-8" href="${video.wwwUrl}" target=_blank>${video.name?html}</a><small class="col-xs-4 text-right">${video.publishedAt?string("yyyy-MM-dd")}</small></li>
              [#else]
                <li><a class="col-xs-8" href="${base}/video/${video.id}">${video.name?html}</a><small class="col-xs-4 text-right">${video.publishedAt?string("yyyy-MM-dd")}</small></li>
              [/#if]
            [/#list]
            </ul>
          </div>
          [#if videos?size != 0]
          <nav aria-label="Page navigation" class="text-right">
            <ul class="pagination pagination-sm">
              <li[#if videos.pageIndex lte 1] class="disabled"[/#if]>
                <a href="[#if videos.pageIndex lte 1]javascript:void(0)[#else]${base}/nav/${Parameters["id"]}?pageNo=${videos.pageIndex - 1}[/#if]" aria-label="Previous">
                  <span aria-hidden="true">上一页</span>
                </a>
              </li>
              [#assign start = 1/]
              [#if videos.pageIndex gt 3]
                [#assign start = videos.pageIndex - 2/]
              [/#if]
              [#assign end = start + 4/]
              [#if end gt videos.totalPages]
                [#assign end = videos.totalPages/]
                [#if end - 4 gte 1]
                  [#assign start = end - 4/]
                [/#if]
              [/#if]
              [#list start..end as i]
              <li[#if i == videos.pageIndex] class="active"[/#if]><a href="${base}/nav/${Parameters["id"]}?pageNo=${i}">${i}</a></li>
              [/#list]
              <li[#if videos.pageIndex gte videos.totalPages] class="disabled"[/#if]>
                <a href="[#if videos.pageIndex gte videos.totalPages]javascript:void(0)"[#else]${base}/nav/${Parameters["id"]}?pageNo=${videos.pageIndex + 1}[/#if]" aria-label="Next">
                  <span aria-hidden="true">下一页</span>
                </a>
              </li>
            </ul>
          </nav>
          [/#if]
        </div>
