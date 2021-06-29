"use strict";

$(document).on("click", ".item-nav.has-tree a", function (e) {
  $(this).parent().toggleClass("menu-open");
  $(this).toggleClass("active");
  $(this).parent().find(".nav-treeview").toggleClass("open");
});
$(document).on("click", ".nav-item.has-chil-level a", function (e) {
  $(this).parent().toggleClass("menu-open");
  $(this).next(".nav-level").toggleClass("on");
});
$(document).on("click", "#pushmenu", function (e) {
  e.preventDefault();
  var width_windows = $(window).width();

  if (width_windows > 1024) {
    $(".body-global").toggleClass("sidebar-collapse");
  } else {
    $(".body-global").toggleClass("sidebar-open");
    $(".warap-sidebar-global").css({
      left: "0"
    });
    $("body").append("<div id='sidebar-overlay' class='sidebar-overlay'></div>");
  }
});
$(document).on("click", "#sidebar-overlay", function (e) {
  $(this).remove();
  $(".warap-sidebar-global").css({
    left: "-250px"
  });
});
$(document).on("click", ".name-auth", function (e) {
  $(this).parent().toggleClass("on");
});
$(document).on("click", ".nav-right li", function (e) {
  $(this).toggleClass("opened");
  e.preventDefault();
});
$(window).on("resize", function () {
  var win = $(this); //this = window
  // if (win.height() >= 820) {}

  if (win.width() > 1024) {
    $(".warap-sidebar-global").css({
      left: 0
    });
  } else {
    $(".warap-sidebar-global").css({
      left: "-250px"
    });
    $(".body-global ").removeClass("sidebar-collapse");
    $(".body-global ").removeClass("sidebar-open");
    $("#sidebar-overlay").remove();
  }
});
$(document).mouseup(function (e) {
  var container = $(".dropdown-auth"); // if the target of the click isn't the container nor a descendant of the container

  if (!container.is(e.target) && container.has(e.target).length === 0) {
    container.removeClass("on");
  }

  var container1 = $(".indicator__dropdown"); // if the target of the click isn't the container nor a descendant of the container

  if (!container.is(e.target) && container.has(e.target).length === 0) {
    container1.parent().removeClass("opened");
  }
});