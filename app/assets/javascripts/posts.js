Posts = {

	init:function(){

	$('#create_post').die('click').live('click',function(e){
		e.preventDefault();			
		var chapter_id= $('#group_admin_ref').attr('chapter_id');
		$.ajax({
		      url: '/posts/new',		      
		      success: function(data){		          
		          $('#event_content').html(data);
		          $('#post_chapter_id').val(chapter_id);
		      },
		      async:false,        
		      dataType: 'html'
		    }); 			
		});		

	}

}