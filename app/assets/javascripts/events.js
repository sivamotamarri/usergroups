Events ={  

	init:function(){
		$('#create_event').live('click',function(){			
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

	}


};