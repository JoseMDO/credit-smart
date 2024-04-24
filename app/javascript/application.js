// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import jquery from "jquery";
window.jQuery = jquery;
window.$ = jquery;
import Rails from "@rails/ujs"
Rails.start();


function toggleRoundedClass() {
  const image = document.getElementById('hero-image');
  if (window.innerWidth <= 767) {
    image.classList.remove('rounded-start-pill');
  } else {
    image.classList.add('rounded-start-pill');
  }
}

function toggleLandingPageClass() {
  const images = document.getElementsByClassName('landing-card');
  for (let i = 0; i < images.length; i++) {
    const image = images[i];
    if (window.innerWidth <= 767) {
      image.classList.remove('landing-page-card');
    } else {
      image.classList.add('landing-page-card');
    }
  }
}


window.addEventListener('resize', toggleRoundedClass);
window.addEventListener('resize', toggleLandingPageClass);
