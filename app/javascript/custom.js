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

//サムネイル

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



	
