// slick-slider

// $(function() {
//   $('#slider').slick({
//     infinite: true,
//     speed: 300,
//     slidesToShow: 1,
//     centerMode: true,
//     variableWidth: true,
//     arrows: true,
//     responsive: [
//       {
//         breakpoint: 670,
//       }
//     ]
//   });
// });
$(function() {
  $('#slider-deleted').slick({
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    centerMode: true,
    variableWidth: true
  });
});
$(function() {
  $('.area-card').slick({
    dots: false,
    slidesToShow: 2,
    slidesToScroll: 2,
    centerMode: true,
    arrows: true
  })
})


//サムネイル
// $(function() {
//   const area = new Swiper(".area", {
//     loop: true,
//     navigation: {
//       nextEl: '.swiper-button-next',
//       prevEl: '.swiper-button-prev',
//     },
//   })
// })


$(function() {
  var sliderThumbnail = new Swiper('.slider-thumbnail', {
    slidesPerView: 4,
    freeMode: true,
    watchSlidesVisibility: true,
    watchSlidesProgress: true,
  });
  
  //スライダー
  var slider = new Swiper('.show-slider', {
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    loop: true,
    thumbs: {
      swiper: sliderThumbnail
    }
  });
})


$(function() {
  const swiper = new Swiper(".mySwiper", {
    loop: true,
    slidesPerView: 1.5,
    centeredSlides : true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
})






	
