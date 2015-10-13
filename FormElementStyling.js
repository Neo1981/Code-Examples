<script>

	$('input:text, textarea, select').focus(function() {
        $(this).css({'border' : '2px solid rgb(1,1,1)'});
		$(this).css({'background' : '#DEE9F4'});
    });;


	$('input:text, textarea, select').blur(function() {
        $(this).css({'border' : '1px solid #666666'});
		$(this).css({'background' : '#FFFFFF'});
    });


</script>
