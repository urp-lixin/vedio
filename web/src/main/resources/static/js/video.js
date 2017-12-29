$(function() {
  window.imgPreview = function() {
    var formObj = $("");
  };
  
  $(document).ready(function() {
    $(".title").css("width", "120px");
    
    $(":file[name=image]").change(function() {
      var formData = new FormData();
      formData.append("image", document.videoForm["image"].files[0]);
      console.log(formData.values().next());
      $.ajax({
        "type": "POST",
        "url": beangle.contextPath + "/admin/video/imageUpload",
        "async": false,
        "dataType": "html",
        "data": formData,
        "cache": false,
        "context": this, // 上下文，使得在done中可以调用
        "processData": false,
        "contentType": false
      }).done(function(data) {
        if (!$("td#imageNone").size()) {
          var tdObj = $("<td>");
          tdObj.attr("id", "imageNone");
          $(this).parent().before(tdObj);
        }
        $("td#imageNone").empty();
        $("td#imageNone").append(data);
        $(this).val("");
      });
    });
    
    $(":file[name=video]").change(function() {
      if (!this.value) {
        return false;
      }
      
      var formData = new FormData();
      formData.append("video", document.videoForm["video"].files[0]);
      console.log(formData.values().next());
      $.ajax({
        "type": "POST",
        "url": beangle.contextPath + "/admin/video/videoUpload",
        "async": true,
        "dataType": "html",
        "data": formData,
        "cache": false,
        "context": this, // 上下文，使得在done中可以调用
        "processData": false,
        "contentType": false,
        "xhr": function() {
          var xhr = $.ajaxSettings.xhr();
          if (xhr.upload) {
            xhr.upload.onprogress = function(progress) {
//              console.log(progress.loaded / progress.total * 100);
              if (progress.lengthComputable) {
                $("#upload").css("width", (progress.loaded / progress.total * 100) + "%");
              }
            };
            
            xhr.upload.onloadstart = function() {
              $(":file[name=video]")[0].disabled = true;
              
              if ($("#upload").size() == 0) {
                var tdObj = $("<td>");
                
                var uploadPObj = $("<div>");
                uploadPObj.css("width", "200px");
                uploadPObj.css("height", "20px");
                uploadPObj.css("background-color", "LightGrey");
                tdObj.append(uploadPObj);
                
                var uploadObj = $("<div>");
                uploadObj.attr("id", "upload");
                uploadObj.css("width", "0%");
                uploadObj.css("height", "100%");
                uploadObj.css("background-color", "red");
                uploadPObj.append(uploadObj);
                
                $(":file[name=video]").parent().parent().append(tdObj);
              }
            };
//            console.log(xhr);
          }
          return xhr;
        }
      }).done(function(data) {
        $("#upload").parent().parent().remove();
        
        if (!$("td#videoNone").size()) {
          var tdObj = $("<td>");
          tdObj.attr("id", "videoNone");
          $(this).parent().before(tdObj);
        }
        $("td#videoNone").empty();
        $("td#videoNone").append(data);
        $(this).val("");
        
        $(":file[name=video]")[0].disabled = false;
      }).error(function(data) {
        $("#upload").css("background-color", "");
        $("#upload").text(data);
      });
    });
  });
});