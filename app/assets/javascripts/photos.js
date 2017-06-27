$(document).on("turbolinks:load", function() {
  $('.modal-dialog').on('keypress', '#comment_content', function(event){
      if((event.keyCode == 10 || event.keyCode == 13) && event.ctrlKey){
           $(this).closest('form').submit();
           event.preventDefault();
           event.stopPropagation();
           return false;
       }
    });
});