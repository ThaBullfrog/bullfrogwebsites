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

$( document ).on('turbolinks:render', function() {
  if (document.documentElement.hasAttribute("data-turbolinks-preview")) {
    $(".animated").css('display', 'none');
    $(".animated-child").css('display', 'none');
  }
});

$animation_elements = $('.animated');
$animation_parent_elements = $('.animated-parent');
$animation_elements_positions = []
$animation_parent_elements_positions = []
$window = $( window );

function update_animation_elements_positions() {
  $animation_elements_positions = []
  $.each($animation_elements, function() {
    var $element = $(this)
    $animation_elements_positions.push({elem: $element, position: $element.offset().top + $element.outerHeight() / 2})
  });
}

function update_animation_parent_elements_positions() {
  $animation_parent_elements_positions = []
  $.each($animation_parent_elements, function() {
    var $element = $(this)
    $animation_parent_elements_positions.push({elem: $element, position: $element.offset().top + $element.outerHeight() / 2})
  });
}

$( document ).on('turbolinks:load', function() {
  $animation_elements = $(".animated");
  $animation_parent_elements = $(".animated-parent");
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
    if ((element_middle_position >= window_top_position) &&
        (element_middle_position <= window_bottom_position)) {
      $element.addClass('in-view');
    } else {
      $element.removeClass('in-view');
    }
  }
  var array2_length = $animation_parent_elements_positions.length;
  for (var i = 0; i < array2_length; i++) {
    var $info = $animation_parent_elements_positions[i];
    var $element = $info.elem;
    var element_middle_position = $info.position;

    //check to see if this current container is within viewport
    if ((element_middle_position >= window_top_position) &&
        (element_middle_position <= window_bottom_position)) {
      $(".animated-child", $element).addClass('in-view');
    } else {
      $(".animated-child", $element).removeClass('in-view');
    }
  }
}

$window.on('scroll', check_if_in_view);
$window.on('resize', function() {
  update_animation_elements_positions();
  update_animation_parent_elements_positions();
  check_if_in_view();
});