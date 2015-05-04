$(document).ready(function(){
  var position = (typeof $.cookie('slide_top_panel'));

  if (position != 'undefined') {
    position = ($.cookie('slide_top_panel'));
    if (position == 'up') {
      $('.navbar-inverse').css('border-top','0px');
      $('#head_panel_down').show();
      $('#head_panel_up').css('display', 'none');
      $('#head').hide();
    } else {
      $('.navbar-inverse').css('border-top','solid 1px silver');
      $('#head_panel_down').css('display', 'none');
      $('#head_panel_up').show();
      $('#head').show();
    };
  } else {
    $('.navbar-inverse').css('border-top','solid 1px silver');
    $('#head_panel_down').fadeOut();
    $('#head_panel_up').fadeIn();
    $('#head').toggle();
  };

  $(".comment_panel").click(function() {
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
    $("#developer_panel").slideToggle("slow");
  });

  $('a[data-remote]').bind('ajax:success', function() {
    $(this).closest('.row').fadeOut("slow");
  })

  $("#head_panel_down").click(function() {
    $.cookie('slide_top_panel', 'down', {path: "/"});
    $('.navbar-inverse').css('border-top','solid 1px silver');
    $('#head_panel_down').fadeOut('slow');
    $('#head_panel_up').fadeIn('slow');
    $("#head").slideDown("slow");
  });

  $("#head_panel_up").click(function() {
    $.cookie('slide_top_panel', 'up', {path: "/"});
    $('.navbar-inverse').css('border-top','0px');
    $('#head_panel_down').fadeIn('slow');
    $('#head_panel_up').fadeOut('slow');
    $("#head").slideUp("slow");
  });
  /*
  if (typeof $.cookie('slide_top_panel') === 'undefined') {
    $("#head_panel_down").click();
  };
  */
});
