$(function() {
  var form = document.vodSearchForm;
  
  $(document).ready(function() {
    $(form).find("input").keypress(function(e) {
      if (e.which == 13) {
        $(form).find("button").click();
      }
    });
    
    $(form).find("button").click(function() {
      if (form.key.value.replace(/\s/mg, "").length == 0) {
        return false;
      } else {
        form.action = form.action.replace("index/", form.key.value);
        form.submit();
        return true;
      }
    });
  });
});