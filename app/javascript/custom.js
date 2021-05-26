// slick-slider

$(function() {
  $('#slider').slick({
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    centerMode: true,
    variableWidth: true,
    responsive: [
      {
        breakpoint: 670,
        arrows: false
      }
    ]
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
    // arrows: true,
    dots: true,
    infinite: true,
    speed: 500,
    fade: true,
    cssEase: 'linear',
    row: 0,
    responsive: [
      {
        breakpoint: 670,

        setting: {
          arrows: false
        }
      }
    ]
  });
})
