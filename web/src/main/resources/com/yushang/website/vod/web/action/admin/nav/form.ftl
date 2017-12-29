[@b.head/]
  [@b.toolbar title="栏目配置"]
    bar.addBack();
  [/@]
  [@b.form name="navForm" action="!save" target="navs" theme="list"]
    [@b.textfield label="名称" name="nav.name" value=(nav.name)! required="true" maxlength="10"/]
    [@b.validity]
      $("[name='nav.name']", document.navForm).require().assert(function() {
        var isOk = false;
        
        $.ajax({
          "type": "POST",
          "url": "${b.url("!checkAjax")}",
          "async": false,
          "dataType": "json",
          "data": {
            "id": document.navForm["nav.id"].value,
            "name": document.navForm["nav.name"].value
          },
          "success": function(data) {
            isOk = data.isOk;
          }
        });
        
        return isOk;
      }, "名称已存在！！！");
    [/@]
    [@b.textfield label="排列顺序" name="nav.indexNo" value=nav.persisted?string(nav.indexNo, "") required="true" maxlength="10" check="match('integer').greaterThan(0)" comment="说明：如果排列顺序与现有记录的排列顺序相同，则表示本记录插于此记录之前。"/]
    [@b.formfoot]
      <input type="hidden" name="nav.id" value="${nav.persisted?string(nav.id, "")}"/>
      [@b.submit value="提交"/]
    [/@]
  [/@]
[@b.foot/]