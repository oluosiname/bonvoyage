$(document).ready(function() {

  function deletePassenger() {
    $(".delete_passenger").click(function() {
      $(this).parents("div.nested-fields.passengers").remove();
      alert("working");
    });
  }
  deletePassenger();
});
