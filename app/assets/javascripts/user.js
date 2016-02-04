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
});
