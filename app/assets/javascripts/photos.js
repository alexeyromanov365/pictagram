$(document).on("turbolinks:load", function() {
    $('.photo-img').on('click', function() {
    $('.enlargeImageModalSource').attr('src', $(this).attr('src'));
    $('#enlargeImageModal').modal('show');
  });
});