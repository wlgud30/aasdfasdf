jQuery(document).ready(function($) {
  $('.btn_area').append('<div class="line_ain_area"><span class="line_ain"></span></div>');

  function loop() {
    $('.club_btn .line_ain').animate({
      height: 80,
      width: 80,
      opacity: 0
    }, 800).animate({
      height: 68,
      width: 68,
      opacity: 0.8
    }, 800)
  }

  function loopb() {
    $('.contest_btn .line_ain').animate({
      height: 80,
      width: 80,
      opacity: 0
    }, 800).animate({
      height: 68,
      width: 68,
      opacity: 0.8
    }, 800);
  }
  setInterval(function() {
    loop();
  }, 0)
  setInterval(function() {
    loopb();
  }, 600)
});