$(document).ready(function() {
  $("#show_password").hover(function() {
    $("#password").attr("type","text");
  });
  $("#show_password").focusout(function() {
    $("#password").attr("type","password");
  });

});
