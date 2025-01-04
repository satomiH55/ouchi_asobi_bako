$(function () {
    $('#js-hamburger-menu, .nav-link').on('click', function () {
      $('.nav-links').slideToggle(500)
      $('.menu-icon').toggleClass('menu-icon--open')
    });
  });