// Mobile navigation toggle
(function () {
  var toggle = document.querySelector('.site-nav__toggle');
  var navLinks = document.querySelector('.site-nav__links');

  if (toggle && navLinks) {
    toggle.addEventListener('click', function () {
      var isOpen = navLinks.classList.toggle('is-open');
      toggle.setAttribute('aria-expanded', String(isOpen));
    });
  }
})();
