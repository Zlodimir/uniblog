$(document).ready(function(){
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
    $('.navbar-inverse').css('border-top','solid 1px silver');
    $('#head_panel_down').fadeOut();
    $('#head_panel_up').fadeIn();

    $("#head").slideDown("slow");
  });

  $("#head_panel_up").click(function() {
    $('.navbar-inverse').css('border-top','0px');
    $('#head_panel_down').fadeIn();
    $('#head_panel_up').fadeOut();
    $("#head").slideUp("slow");
  });

  //$("#head_panel_down").click();
});
