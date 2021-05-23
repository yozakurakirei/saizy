console.log("hello!")

let posts = document.querySelector(".post");
let postHeader = posts.querySelector(".post-header");
let postBody = posts.querySelector(".post-body");
let Indicator = posts.querySelector(".post-indicator");
let postHeaderNodes = posts.querySelectorAll(".post-header > div");
let postBodyNodes = posts.querySelectorAll(".post-body > div");

for(let i = 0; i < postHeaderNodes.length; i ++){
  postHeaderNodes[i].addEventListener("click", function() {
    postHeader.querySelector(".active").classList.remove("active");
    postHeaderNodes[i].classList.add("active");
    postBody.querySelector(".active").classList.remove("active");
    postBodyNodes[i].classList.add("active");
    Indicator.style.left = `calc(calc(calc(25% - 5%) * ${i}) + 10px)`;
    
  })
} 