              <span class="col-sm-8 col-xs-12">
                <span class="m_r_20"><a href="javascript:good(${videoStat.video.id});"><img class=" p_relative p_img01" src="${b.static_url('video','images/dz.png')}" width="22" /></a>${videoStat.good}</span>
                <span class="m_r_20"><a href="javascript:bad(${videoStat.video.id});"><img src="${b.static_url('video','images/dz2.png')}" width="20" /></a>${videoStat.bad}</span>
                <span class="m_r_20"><a href="javascript:void(0);"><img src="${b.static_url('video','images/fx.png')}" width="16" />分享给好友</a></span>
              </span>
              <span class=" col-xs-12 col-sm-4 text-right"><span><img class=" p_relative p_img01" src="${b.static_url('video','images/fw1.png')}" width="24" /></span><span>${videoStat.statInfoes?size}</span></span>
