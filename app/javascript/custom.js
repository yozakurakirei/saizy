// slick-slider

// first-slider 
$(function() {
  $('.slider-one')
  .not("slick-intialized")
  .slick({
    dots: true,
    prevArrow: ".site-slider .slider-btn .prev",
    nextArrow: ".site-slider .slider-btn .next"
  });
});


$(function() {
  $('.slider-three')
  .not("slick-intialized")
  .slick({
    prevArrow: ".site-slider-three .prev",
    nextArrow: ".site-slider-three .next",
    slidesToShow: 4,
    slidesToScroll: 2,
    inifinite: true
  });
});

$(function() {
  $('#slider').slick({
    dots: true,
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    centerMode: true,
    variableWidth: true
  });
});
$(function() {
  $('#slider-deleted').slick({
    dots: true,
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    centerMode: true,
    variableWidth: true
  });
});

$(function() {
  $('.show-slide-image').slick({
    arrow: true,
    dots: true
  });
})
// $('#show-slider').slick({
//   slidesToShow: 3,
//   slidesToScroll: 1,
//   asNavFor: '#show-slider',
//   dots: true,
//   centerMode: true,
//   focusOnSelect: true
// });
