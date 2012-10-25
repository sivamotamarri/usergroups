Events ={  

	init:function(){
		$('#create_event').die('click').live('click',function(e){
		   e.preventDefault();			
			var chapter_id= $('#group_admin_ref').attr('chapter_id');
		    
		    $.ajax({
		      url: '/events/new',		      
		      success: function(data){		          
		          $('#admincontent').html(data);
		          $('#event_chapter_id').val(chapter_id);
		      },
		      async:false,        
		      dataType: 'html'
		    }); 			
		});

	$('#follow_an_event').die('click').live('click', function(e){
   
      var data = {event_id: $(this).attr('event_id')};    
      
      $.ajax({
        url: '/events/follow_an_event',
        data : data,
        success: function(data){
            $('#event_content').html(data);            
        },
        async:false,        
        dataType: 'html'
      });
    
  });

  }

}