        <div class="col-md-3">
          <h4 class="page-header c_warning"><span class="span_t">视频推荐</span></h4>
          <div class="bd" id="scroll_bd">
            <div class="top" id="bd">
              <ul id="ul">
              [#list recommends as recommend]
                <li href="${base}/video/${recommend.video.id}"><img src="${base}/video/image/${recommend.video.id}"/><div>${recommend.video.name}</div></li>
              [/#list]
              </ul>
            </div>

            <div class="scroll" id="scroll">
              <p id="p"></p>
            </div>
          </div>
        </div>
