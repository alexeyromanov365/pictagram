var test = function() {
  // Get the modal
  var modal = $('#myModal');

  // Get the image and insert it inside the modal - use its "alt" text as a caption
  var modalImg = $("#img01");
  var captionText = $("#caption");
  $('.my-photos').on('click', '.my-img', function(){
    $(modal).show();//.style.display = "block";
    modalImg.attr('src', this.src);
    captionText.html(this.alt);
  });

  // Get the <span> element that closes the modal
  var span = $(".close");

  // When the user clicks on <span> (x), close the modal
  span.on('click', function() {
    modal.hide();
  })
}

$(document).ready(function(){
  test();
})



/*$(function() {
      $('img').on('click', function() {
      $('.enlargeImageModalSource').attr('src', $(this).attr('src'));
      $('#enlargeImageModal').modal('show');
    });
});*/