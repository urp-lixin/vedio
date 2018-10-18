$(function() {
  $(document).ready(function() {
    window.good = function(id) {
      $.ajax({
        "type": "POST",
        "url": beangle.contextPath + "/vod/video/goodAjax/" + id,
        "async": false,
        "dataType": "html",
        "success": function(data) {
          var statInfoObj = $(".m_r_20").parent().parent();
          statInfoObj.empty();
          statInfoObj.append(data);
        }
      });
    };
    
    window.bad = function(id) {
      $.ajax({
        "type": "POST",
        "url": beangle.contextPath + "/vod/video/badAjax/" + id,
        "async": false,
        "dataType": "html",
        "success": function(data) {
          var statInfoObj = $(".m_r_20").parent().parent();
          statInfoObj.empty();
          statInfoObj.append(data);
        }
      });
    };
  });
});