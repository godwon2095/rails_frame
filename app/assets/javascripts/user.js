$(function(){
  $('#image_upload_button').on('click', function(){
    $('input#user_image').trigger('click');
  });

  $('input#user_image').on('change', function(){
    readURL(this);
  });
});

function readURL(input) {
   if (input.files && input.files[0]) {
     var reader = new FileReader();
     reader.onload = function (e) {
         $('img#profile_image_display').attr('src', e.target.result);
     };
     reader.readAsDataURL(input.files[0]);
   }
 }
