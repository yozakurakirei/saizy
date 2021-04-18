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

// second-slider
$(function() {
  $('.slider-two')
  .not("slick-intialized")
  .slick({
    prevArrow: ".site-slider-two .prev",
    nextArrow: ".site-slider-two .next",
    slidesToShow: 4,
    slidesToScroll: 1
  });
});

