$(document).on('turbolinks:load', function () {
  $("#checkbox_consent").click(function () {
    this.checked ? $("#button_delete_account").removeClass("disabled") : $("#button_delete_account").addClass("disabled");
  });
});
