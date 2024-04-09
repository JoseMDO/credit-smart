// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


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

function toggleShowTransactionClass() {
  const cards = document.getElementsByClassName('t-card');
  console.log(cards)
  for (let i = 0; i < cards.length; i++) {
    const card = cards[i];
    if (window.innerWidth <= 767) {
      card.classList.remove('transaction-card');
    } else {
      card.classList.add('transaction-card');
    }
  }
}
// Call the functions initially and add listeners for window resize
// toggleRoundedClass();
toggleLandingPageClass();
toggleShowTransactionClass()

window.addEventListener('resize', toggleRoundedClass);
window.addEventListener('resize', toggleLandingPageClass);
window.addEventListener('resize', toggleShowTransactionClass);
