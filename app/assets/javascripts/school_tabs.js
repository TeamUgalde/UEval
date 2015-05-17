var ready = function() {

  var schoolId = $('#school-id').attr('schoolId');

  $('.school-tab').click(function() {
    var resource = $(this).attr('resource');
    $.ajax({
        method: "get",
        url: "/schools/"+schoolId+"/"+resource,
        async: true,
        success: function(html){
            if(html != "") $("#"+resource).html(html);
        }
    });
  });
    
  $.ajax({
    method: "get",
    url: "/schools/"+schoolId+"/courses",
    async: true,
    success: function(html){
        if(html != "") $("#courses").html(html);
    }
  });
}    

$(document).on('page:load', ready);
$(document).ready(ready);