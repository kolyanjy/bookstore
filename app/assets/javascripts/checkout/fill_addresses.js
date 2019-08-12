$(document).on('turbolinks:load', function () {
  $('#hidden_shipping_form').click(function () {
    this.checked ? $('.shipping_address_js').slideUp(800) : $('.shipping_address_js').slideDown(800);
  });
});
