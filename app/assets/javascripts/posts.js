Posts = {


	titlecomplete: function(){

		

		$("#post_event_title").autocomplete({
            minLength: 3,
            source: function(request, response) {
		        $.ajax({
		          url: $("#post_event_title").attr('data-autocomplete-source'),
		           dataType: "json",
		           data: {
		            	term : request.term,
		            	chapter_id: $('#post_chapter_id').val()
		          	}, 
		          success: function(data) {
		            response(data);
		          }
		        });
		      },           
            focus: function( event, ui ) {
                $( "#post_event_title" ).val( ui.item.label );
                return false;
            },
            select: function( event, ui ) {               
                $( "#post_event_title" ).val( ui.item.label );
                $( "#post_event_id" ).val( ui.item.value );
                return false;
            }
        });
	},

	

	init:function(){

	$('#create_post').die('click').live('click',function(e){
		e.preventDefault();			
		var chapter_id= $('#group_admin_ref').attr('chapter_id');
		$.ajax({
		      url: '/posts/new',		      
		      success: function(data){		          
		          $('#events').html(data);
		          $('#post_chapter_id').val(chapter_id);
		      },
		      async:false,        
		      dataType: 'html'
		    }); 			
		});

		$('#post_form_submit').die('click').live('click', function(e){
    		$('#options').hide();
    		$('#spinner').show();
  		});		

		Posts.titlecomplete();
	    
	}

	

}