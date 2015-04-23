$(document).ready(function(){
    $(".comment_panel").click(function() {
    	$(this).animate({
    		//opacity: '0.4',
    		width: '110px',
    		border: '1px',
			//height: '30px',
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
});
