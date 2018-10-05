$(document).ready(function(){
  $("#users-search #term").on("keyup", function(){
    var selecting_item = $.get(
      $("#users-search").attr("action"),
      {term: $("#users-search #term").val()},
      function(){
        var result = $("#users-result").html();
        if(!result){
          $("#users-search #term").popover({
            content:"We couldn't find anything",
            placement: "bottom",
            html: true,
            trigger: "focus"
          });
        } else {
         $("#users-search #term").popover({
            content: $("#users-result"),
            placement: "bottom",
            html: true,
            trigger: "focus"
          });
        }
       $("#users-search #term").popover("show");
      }
    )
  })
});
