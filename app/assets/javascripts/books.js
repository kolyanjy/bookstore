$(document).on('turbolinks:load', function() {
  var MIN_VALUE = 1
  var MAX_VALUE = 100

  $('#btn_read_more').click(function() {
    $('#small_text').hide();
    $('#block_more').css('display', 'inline');
    $('#btn_read_more').hide();
  });

  $('#btn_hide_read_more').click(function() {
    $('#small_text').show();
    $('#block_more').hide();
    $('#btn_read_more').show();
  })

  $('#minus').click(function(e) {
    var currentValue = $('.input-count-book').val();
    if (currentValue > MIN_VALUE) {
      var newValue = Number(currentValue) - 1;
      $('.input-count-book').val(newValue);
    }
  });

  $('#plus').click(function(e) {
    var currentValue = $('.input-count-book').val();
    if (currentValue < MAX_VALUE) {
      var newValue = Number(currentValue) + 1;
      $('.input-count-book').val(newValue);
    }
  });
});
