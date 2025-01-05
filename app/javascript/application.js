// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require popper
//= require bootstrap
import "@hotwired/turbo-rails"
import "controllers"

import "jquery";

$(function () {
    $('#js-hamburger-menu, .nav-link').on('click', function () {
        $('.navigation').slideToggle(500);
        $('.hamburger-menu').toggleClass('hamburger-menu--open');
        
        // コンソールにメッセージを出力
        console.log('ハンバーガーメニューがクリックされました');
    });

    // ウィンドウサイズが変更されたときにナビゲーションをリセット
    $(window).on('resize', function() {
        if ($(window).width() > 575) {
            // パソコン版ではナビゲーションを常に表示
            $('.navigation').show();
        } else {
            // スマホ版ではナビゲーションを非表示
            $('.navigation').hide();
        }
    }).trigger('resize'); // ページロード時にもリセット処理を実行
});