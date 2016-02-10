$(document).ready(function() {

  function previousNext() {
    if ($("#currentPage").val() === "1") {
      $("#previous").addClass("disabled");
      $("#previous").click(function() {
        return false;
      });
    }
    if ($("#currentPage").val() === $("#lastPage").val()) {
      $("#next").addClass("disabled");
      $("#next").click(function() {
        return false;
      });
    }
  }

  function checkPassword() {
    if ($("#password").val() !== $("#confirmpassword").val()) {
      $("#submit-signup").attr("disabled",true);
      $("#password-error").text("Passwords Do Not Match");
    }
    else {
      $("#submit-signup").attr("disabled",false);
      $("#password-error").text("");
    }
  }
  previousNext();
  $("#confirmpassword").on("focusout keyup change", checkPassword);
  $("#password").on("focusout keyup change", checkPassword);

});
