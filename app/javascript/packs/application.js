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
import './custom'
import './map'
import './tab'
import './raty'

// Rails.start()
// // Turbolinks.start()
// ActiveStorage.start()

// googlemaps
window.initMap = function(...args) {
  const event = document.createEvent("Events")
  event.initEvent("google-maps-callback", true, true)
  event.args = args
  window.dispatchEvent(event)
}

// window.$ = window.jQuery = require('jquery'); //追記