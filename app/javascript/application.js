// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require popper
//= require bootstrap
import "@hotwired/turbo-rails"
import "controllers"

import "jquery";

document.addEventListener('turbo:load', function() {
    $('#js-hamburger-menu, .nav-link').on('click', function () {
        $('.navigation').slideToggle(500);
        $('.hamburger-menu').toggleClass('hamburger-menu--open');

        console.log('ハンバーガーメニューがクリックされました');
    });

    $(window).on('resize', function() {
        if ($(window).width() > 575) {
            $('.navigation').show();
        } else {
            $('.navigation').hide();
        }
    }).trigger('resize');
});