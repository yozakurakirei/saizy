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

// $(function() {
//   $('.show-image').slick({
//     // arrows: true,
//     dots: true,
//     infinite: true,
//     speed: 500,
//     fade: true,
//     cssEase: 'linear',
//     responsive: [
//       {
//         breakpoint: 670,
//         dots: false,
//       }
//     ]
//   });
// })
