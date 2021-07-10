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
$(function() {
  const swiper = new Swiper(".miniSwiper", {
    loop: true,
    slidesPerView: 3,
    centeredSlides : true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
})

// review


	
