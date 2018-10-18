{
  "navs": [ [#list navs?sort_by(["indexNo"]) as nav]{ "id": ${nav.id}, "name": "${nav.name}" }[#if nav_has_next], [/#if][/#list] ]
}
