$(function() {
  function navs() {
//    var m = 6;
    var m = 20;
    
    var normalObj = $(".navbar-nav");
    var moreObj = null;
    
    var normalBuilder = function(id, name) {
      var liObj = $("<li>");
      
      var aObj = $("<a>");
      aObj.attr("href", beangle.contextPath + "/nav/" + id);
      aObj.text(name);
      liObj.append(aObj);
      normalObj.append(liObj);
    };
    
    var moreBuilder = function(id, name) {
      if (null == moreObj) {
        var mLiObj = $("<li>");
        mLiObj.addClass("dropdown");
        normalObj.append(mLiObj);
        
        var mAObj = $("<a>");
        mAObj.attr("href", "#");
        mAObj.addClass("dropdown-toggle");
        mAObj.attr("data-toggle", "dropdown");
        
        var mBObj = $("<b>");
        mBObj.addClass("caret");
        mAObj.append("更多&nbsp;");
        mAObj.append(mBObj);
        mLiObj.append(mAObj);
        
        moreObj = $("<ul>");
        moreObj.addClass("dropdown-menu");
        mLiObj.append(moreObj);
      }
      
      var liObj = $("<li>");
      
      var aObj = $("<a>");
      aObj.attr("href", beangle.contextPath + "/nav/" + id);
      aObj.text(name);
      liObj.append(aObj);
      moreObj.append(liObj);
    };
    
    $.ajax({
      "type": "POST",
      "url": beangle.contextPath + "/nav",
      "async": false,
      "dataType": "json",
      "success": function(data) {
        
        for (var i = 0; i < data.navs.length; i++) {
          if (i < m) {
            normalBuilder(data.navs[i].id, data.navs[i].name);
          } else {
            moreBuilder(data.navs[i].id, data.navs[i].name);
          }
        }
      }
    });
  }
  
  $(document).ready(function() {
    navs();
  });
});