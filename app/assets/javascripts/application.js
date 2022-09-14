// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require jquery.easing.min
//= require smoothscroll
//= require response.min
//= require jquery.placeholder.min
//= require jquery.fitvids
//= require waypoints.min
//= require slick.min
//= require jquery.mousewheel-3.0.6.pack
//= require jquery.fancybox.pack
//= require jquery.fancybox-media
//= require parallax.min
//= require jquery.counterup.min
//= require jquery.stickem
//= require script
//= require smoothscroll
//= require chosen-jquery
//= require jquery.magnific-popup.min

$(function() {
    $('.chosen-select').chosen({
        allow_single_deselect: true,
        no_results_text: 'No results matched'
    })
});

