        <div class="col-md-3">
          <h4 class="page-header c_warning"><span class="span_t">视频推荐</span></h4>
          <div class="bd" id="scroll_bd">
            <div class="top" id="bd">
              <ul id="ul">
              [#list recommends as recommend]
                [#if recommend.video.wwwUrl??]
                  <li><a href="${recommend.video.wwwUrl}" target=_blank><img src="${base}/video/image/${recommend.video.id}" width="100%"/></a><div>${recommend.video.name}</div></li>
                [#else]
                  <li><a href="${base}/video/${recommend.video.id}"><img src="${base}/video/image/${recommend.video.id}" width="100%"/></a><div>${recommend.video.name}</div></li>
                [/#if]
              [/#list]
              </ul>
            </div>

            <div class="scroll" id="scroll">
              <p id="p"></p>
            </div>
          </div>
        </div>
