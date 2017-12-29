[@b.head/]
  [@b.grid items=navs var="nav"]
    [@b.gridbar]
      bar.addItem("${b.text("action.new")}", action.add());
      bar.addItem("${b.text("action.modify")}", action.edit());
      bar.addItem("${b.text("action.delete")}", action.remove("确认要删除当前选择的栏目吗？"));
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="名称" property="name"/]
      [@b.col title="排序顺序" property="indexNo"/]
    [/@]
  [/@]
[@b.foot/]