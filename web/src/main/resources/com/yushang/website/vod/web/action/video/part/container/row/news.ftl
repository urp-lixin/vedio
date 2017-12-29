        <div class="col-md-9 m_b_20">
          <h4 class="m_t_30">${video.name?html}</h4>
          <div class="video_s">${video.description?html}</div>
          <div class="video_bz"><span class="m_r_10">摄影人：${video.author}</span> <span>时长：[#assign s = video.second/]${(s / 60)?int}分钟${(s % 60 == 0)?string("", (s / 60 - (s / 60)?int) * 60) + "秒"}</span><span class="c_999 pull-right">发布时间：${video.publishedAt?string("yyyy-MM-dd")}</span></div>
          <!--视频区域start-->
          <div class="m_t_15"><video src="${base}/video/video/${video.id}?v=${systemId}" width="100%" controls="controls" title="${video.videoName}"/></div>
          <!--视频区域end-->
          <div class="sp_gn">
            <div class="row">
              <span class="col-sm-8 col-xs-12">
                <span class="m_r_20"><a href="javascript:good(${video.id});"><img class=" p_relative p_img01" src="${base}/static/images/dz.png" width="22" /></a>${(videoStat.good)!0}</span>
                <span class="m_r_20"><a href="javascript:bad(${video.id});"><img src="${base}/static/images/dz2.png" width="20" /></a>${(videoStat.bad)!0}</span>
                <span class="m_r_20"><a href="javascript:void(0);"><img src="${base}/static/images/fx.png" width="16" />分享给好友</a></span>
              </span>
              <span class=" col-xs-12 col-sm-4 text-right"><span><img class=" p_relative p_img01" src="${base}/static/images/fwl.png" width="24" /></span><span>${(videoStat.statInfoes?size)!0}</span></span>
            </div>
          </div>
        </div>
