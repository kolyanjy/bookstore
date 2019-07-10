$(document).on('turbolinks:load', function() {
  $("#checkbox_consent").click(function() {
    $("#checkbox_consent").prop( "checked" ) ? $("#button_delete_account").removeClass("disabled") : $("#button_delete_account").addClass("disabled");
  });
});
