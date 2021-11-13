// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("jquery")
require("bootstrap")
require("popper.js")


import '@fortawesome/fontawesome-free/js/all'
import '../src/application.scss'
import 'swiper/swiper-bundle'
import 'swiper/swiper-bundle.css' 
import 'swiper' 
import './custom'
import './map'
import './tab'
import './raty'

// Rails.start()
// // Turbolinks.start()
// ActiveStorage.start()
 
const images = require.context('../images', true);

// googlemaps
window.initMap = function(...args) {
  const event = document.createEvent("Events")
  event.initEvent("google-maps-callback", true, true)
  event.args = args
  window.dispatchEvent(event)
}

window.$ = window.jQuery = require('jquery'); //追記