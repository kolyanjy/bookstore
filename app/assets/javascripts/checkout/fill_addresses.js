$(document).on('turbolinks:load', function () {
  $('.checkbox-input').click(function () {
    this.checked ? $('.shipping_address_js').slideUp(800) : $('.shipping_address_js').slideDown(800);
  });

  if (window.location.pathname == '/checkout/fill_address') {
    if ($('.checkbox-input').is(':checked')) {
      $('.shipping_address_js').css('display', 'none')
      $('.checkbox-input').attr(':checked', 'true');
    } else {
      $('.shipping_address_js').css('display', 'block');
      $('.checkbox-input').attr(':checked', 'false');
    }
  }
});
