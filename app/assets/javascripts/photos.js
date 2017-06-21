/*$(document).on("turbolinks:load", function() {
  $('.photo-img').on('click', function() {
    var photoId = $(this).attr('id');
    $('.enlargeImageModalSource').attr('src', $(this).attr('src'));
    $('#enlargeImageModal' + photoId).modal('show');
  });
});*/
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