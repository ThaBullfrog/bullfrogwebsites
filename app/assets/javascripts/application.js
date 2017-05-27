// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

/* global $ */

var percent_scroll_past_to_animate = 30;

$( document ).on('turbolinks:render', function() {
  if (document.documentElement.hasAttribute("data-turbolinks-preview")) {
    var $animated = $(".animated");
    $animated.addClass('dont-animate-yet');
    var $animated_child = $(".animated-child");
    $animated_child.addClass('dont-animate-yet');
  }
});

var $animation_elements = $('.animated');
var $animation_parent_elements = $('.animated-parent');
var $animation_elements_positions = []
var $animation_parent_elements_positions = []
var $window = $( window );

function update_animation_elements_positions() {
  $animation_elements_positions = []
  $.each($animation_elements, function() {
    var $element = $(this)
    $animation_elements_positions.push({elem: $element, position: $element.offset().top + $element.outerHeight() * (percent_scroll_past_to_animate / 100)})
  });
}

function update_animation_parent_elements_positions() {
  $animation_parent_elements_positions = []
  $.each($animation_parent_elements, function() {
    var $element = $(this)
    $animation_parent_elements_positions.push({elem: $element, position: $element.offset().top + $element.outerHeight() * (percent_scroll_past_to_animate / 100)})
  });
}

$( document ).on('turbolinks:load', function() {
  $animation_elements = $(".animated");
  $animation_elements.addClass('dont-animate-yet');
  $animation_parent_elements = $(".animated-parent");
  $(".animated-child", $animation_parent_elements).addClass('dont-animate-yet');
  update_animation_elements_positions();
  update_animation_parent_elements_positions();
  check_if_in_view();
});

function check_if_in_view() {
  var window_height = $window.height();
  var window_top_position = $window.scrollTop();
  var window_bottom_position = (window_top_position + window_height);
  var array_length = $animation_elements_positions.length;
  for (var i = 0; i < array_length; i++) {
    var $info = $animation_elements_positions[i];
    var $element = $info.elem;
    var element_middle_position = $info.position;

    //check to see if this current container is within viewport
    if ((element_middle_position <= window_bottom_position)) {
      $element.addClass('in-view');
      $element.removeClass('dont-animate-yet');
    }
  }
  var array2_length = $animation_parent_elements_positions.length;
  for (var i = 0; i < array2_length; i++) {
    var $info = $animation_parent_elements_positions[i];
    var $element = $info.elem;
    var element_middle_position = $info.position;

    //check to see if this current container is within viewport
    if ((element_middle_position <= window_bottom_position)) {
      $(".animated-child", $element).addClass('in-view');
      $(".animated-child", $element).removeClass('dont-animate-yet');
    }
  }
}

$window.on('scroll', check_if_in_view);
$window.on('resize', function() {
  update_animation_elements_positions();
  update_animation_parent_elements_positions();
  check_if_in_view();
});