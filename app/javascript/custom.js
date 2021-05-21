// slick-slider

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
    // arrows: true,
    dots: true,
    infinite: true,
    speed: 500,
    fade: true,
    cssEase: 'linear',
    asNavFor: '.show-slide-thumb',
    responsive: [
      {
        breakpoint: 550,
        setting: {
          arrows: false
        }
      }
    ]
  });

  $('.show-slide-thumb').slick({
    asNavFor: '.show-slide-image',
    arrows: false,
    focusOnSelect: true,
    slidesToShow: 4,
    slidesToScroll: 1
  })
})
