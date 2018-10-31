  <div class="container top_h">
    <div class="row"><div class="col-xs-12 text-right"><a href="http://www.lixin.edu.cn" target="_blank">学校主页</a></div></div>
    <div class="row m_b_35">
      <div class="col-sm-6"><img class="logo" src='${b.static_url("video","images/logo.png")}'></div>
      <form name="vodSearchForm" method="post" action="${b.url("searching")}/" target="_self" onsubmit="return false;">
        <div class="col-sm-6">
          <div class="row">
            <div class="col-xs-12 m_t_15">
              <div class="input-group col-sm-7 pull-right">
                <input type="text" class="form-control" name="key" placeholder="请输入关键字..."/>
                <span class="input-group-btn">
                  <button class="btn btn-default" type="button">查询</button>
                </span>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
