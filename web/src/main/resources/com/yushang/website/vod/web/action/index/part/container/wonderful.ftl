      <h3 class="page-header c_warning">
        <img class="m_r_5" src="${b.static_url("video","images/news.png")}">精彩瞬间
      </h3>

      <div id="myCarousel" class="carousel slide">
        <div class="carousel-inner">
          [#list wonderfuls as wonderful]
            [#if wonderful_index % 3 == 0]
          <div class="item[#if wonderful_index == 0] active[/#if]">
            <div class="row">
            [/#if]
              <div class="col-sm-4 jcsj"><a href="${base}/video/${wonderful.video.id}"><img src="${base}/video/image/${wonderful.video.id}" width="100%" alt=""><div class="jcsj_s">${wonderful.video.name}</div></a></div>
            [#if wonderful_index % 3 == 2 || !wonderful_has_next]
            </div>
          </div>
            [/#if]
          [/#list]
        </div>
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
      </div>
