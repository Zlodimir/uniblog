$(document).ready(function(){
  var position = (typeof $.cookie('slide-top-panel'));

  if (position != 'undefined') {
    position = ($.cookie('slide-top-panel'));
    if (position == 'up') {
      $('.navbar-inverse').css('border-top','0px');
      $('#head-panel-down').show();
      $('#head-panel-up').hide();
      $('#head').hide();
    } else {
      $('.navbar-inverse').css('border-top','solid 1px silver');
      $('#head-panel-down').hide();
      $('#head-panel-up').show();
      $('#head').show();
    }
  } else {
    $('.navbar-inverse').css('border-top','solid 1px silver');
    $('#head-panel-down').fadeOut();
    $('#head-panel-up').fadeIn();
    $('#head').toggle();
  }

  $(".comment-panel").click(function() {
    $(this).animate({
      width: '110px',
      border: '1px',
      backgroundColor: '#C8E6DE',
      borderRadius: '7px'
    });
    $(this).children('span').fadeOut();
    $(this).children('.glyphicon-trash').fadeIn();
  });

  $(".glyphicon-th").bind("click", function() {
    $("#developer-panel").slideToggle("slow");
  });

  $('a[data-remote]').bind('ajax:success', function() {
    $(this).closest('.row').fadeOut("slow");
  });

  $("#head-panel-down").click(function() {
    $.cookie('slide-top-panel', 'down', {path: "/"});
    $('.navbar-inverse').css('border-top','solid 1px silver');
    $('#head-panel-down').fadeOut('slow');
    $('#head-panel-up').fadeIn('slow');
    $("#head").slideDown("slow");
  });

  $("#head-panel-up").click(function() {
    $.cookie('slide-top-panel', 'up', {path: "/"});
    $('.navbar-inverse').css('border-top','0px');
    $('#head-panel-down').fadeIn('slow');
    $('#head-panel-up').fadeOut('slow');
    $("#head").slideUp("slow");
  });
});
