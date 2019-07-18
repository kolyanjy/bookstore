$(document).on('turbolinks:load', function() {
  var min_value = 1
  var max_value = 100

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
    var current_value = $('.input-count-book').val();
    if (current_value > min_value) {
      var new_value = Number(current_value) - 1;
      $('.input-count-book').val(new_value);
    }
  });

  $('#plus').click(function(e) {
    var current_value = $('.input-count-book').val();
    if (current_value < max_value) {
      var new_value = Number(current_value) + 1;
      $('.input-count-book').val(new_value);
    }
  });
});
