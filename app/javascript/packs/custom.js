$(function() {
  console.log('hello')
});

(function() {
  const swiper = new Swiper('.swiper', {
    direction: 'vertical',
    loop: true,
    pagination: {
      el: '.swiper-pagination',
    },
  
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  
    scrollbar: {
      el: '.swiper-scrollbar',
    },
  });

  const thumbSwiper = new Swiper('.slider-thumbnail',{ 
    slidesPerView:'auto',
    spaceBetween:20,
    centeredSlides:true,
    loop:true,
    loopedSlides:thumbSlides.length,
    slideToClickedSlide:true,
    controller:{
      control: mainSwiper
    }
  });
  swiper();
  thumbSwiper();
});



