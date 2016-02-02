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

  previousNext();

  var userNameState = false,
      emailState = false,
      passwordState = false;

  function emailChecker() {
    var pattern = /^([a-z\d_\.\-])+\@(([a-z\d\-])+\.)+([a-z]{2,4})+$/i;
    if (!pattern.test($(this).val())) {
      $(this).addClass("invalid");
      $(this).prev(".small-error").text("Email is invalid");
      emailState = false;
    } else {
      $(this).removeClass("invalid");
      $(this).prev(".small-error").text("");
      emailState = true;
    }
    changeButton();
  }

  function passwordChecker() {
    if ($(this).val().length < 7) {
      $(this).addClass("invalid");
      $(this).prev(".small-error").text("Password " +
        "must be more than 6 characters");
      passwordState = false;
    } else {
      $(this).removeClass("invalid");
      $(this).prev(".small-error").text("");
      passwordState = true;
    }
    changeButton();
  }

  function usernameChecker() {
    if ( $(this).val() === "") {
      $(this).addClass("invalid");
      $(this).prev(".small-error").text("username is required");
      passwordState = false;
    } else {
      $(this).removeClass("invalid");
      $(this).prev(".small-error").text("");
      userNameState = true;
    }
    changeButton();
  }

  function changeButton() {
    if (passwordState && emailState && userNameState) {
      $("#submit-signup").prop("disabled", false);
    } else {
      $("#submit-signup").attr("disabled","disabled");
    }
  }

  $("#user_username").on("focusout keyup change", usernameChecker);
  $("#user_email").on("focusout keyup change", emailChecker);
  $("#password").on("focusout keyup change", passwordChecker);


  $("#show-password").change(function() {
    if ($(this).is(":checked")) {
      $("#password").attr("type","text");
    } else {
      $("#password").attr("type","password");
    }
  });



});
