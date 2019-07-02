jQuery(document).ready(function($) {
  $('.btn_area').append('<div class="line_ain_area"><span class="line_ain"></span></div>');

  function loop() {
    $('.club_btn .line_ain').animate({
      height: 82,
      width: 82,
      opacity: 0
    }, 800).animate({
      height: 72,
      width: 72,
      opacity: 0.8
    }, 900)
  }

  function loopb() {
    $('.contest_btn .line_ain').animate({
      height: 82,
      width: 82,
      opacity: 0
    }, 800).animate({
      height: 72,
      width: 72,
      opacity: 0.8
    }, 900);
  }
  setInterval(function() {
    loop();
  }, 0)
  setInterval(function() {
    loopb();
  }, 700)
});