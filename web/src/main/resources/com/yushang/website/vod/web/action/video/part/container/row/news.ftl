  <script>
    beangle.contextPath="${base}"
  </script>
  ${b.script('video','js/jwplayer.js')}
        <div class="col-md-9 m_b_20">
          <h4 style="text-align:center" class="m_t_30">${video.name?html}</h4>
          <div class="video_bz" style="text-align:center"><span >${video.publishedAt?string("yyyy年MM月dd日")}</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span >来源：${video.author}</span></div>
          <!--视频区域start-->
          [#if video.videoUrl ??]
            <div class="m_t_15"><video src="${video.videoUrl!}" width="100%" controls="controls" autoplay="autoplay" title="${video.videoName}"/></div>
          [#elseif video.localPath ??]
            <div class="m_t_15"><video src="${base}/video/video/${video.id}" width="100%" controls="controls" autoplay="autoplay" title="${video.videoName}"/></div>
          [/#if]
          <!--视频区域end-->
          <!-- <script src='https://content.jwplatform.com/libraries/i511f6Xb.js'></script>-->
          <!-- <script>jwplayer.key='YOUR_KEY';</script>
            <div id="player">Loading the player...</div>

            [#if video.videoUrl ??]
            <script>
              // Setup the player
                const player = jwplayer('player').setup({
                  file: '${video.videoUrl!}',
                  volume: 10
                });
            </script>
            [#elseif video.localPath ??]
            <script>
              // Setup the player
                const player = jwplayer('player').setup({
                  file: '${base}/video/video/${video.id}'+'${suffix}',
                  volume: 10
                });
            </script>
            [/#if]-->
          <div class="sp_gn">
            <div class="row">
              <span class="col-sm-8 col-xs-12">
                <span class="m_r_20"><a href="javascript:good(${video.id});"><img class=" p_relative p_img01" src="${b.static_url('video','images/dz.png')}" width="22" /></a>${(videoStat.good)!0}</span>
                <span class="m_r_20"><a href="javascript:bad(${video.id});"><img src="${b.static_url('video','images/dz2.png')}" width="20" /></a>${(videoStat.bad)!0}</span>
                <!-- <span class="m_r_20"><a href="javascript:void(0);"><img src="${b.static_url('video','images/fx.png')}" width="16" />分享给好友</a></span> -->
              </span>
              <span class=" col-xs-12 col-sm-4 text-right"><span><img class=" p_relative p_img01" src="${b.static_url('video','images/fwl.png')}" width="24" /></span><span>${(videoStat.views)!0}</span></span>
            </div>
          </div>
          <div class="video_s"><h4 style="border-bottom: 1px dotted #000000"><strong style="border-bottom: 2px solid #9e7e33">视频介绍</strong></h4>${video.description?html}</div>
        </div>
