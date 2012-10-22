Events ={  

	init:function(){
		$('#create_event').live('click',function(){
			alert("here");
			//var data = {chapter_id: element.attr('chapter_id')};    
		    
		    $.ajax({
		      url: '/events/new',
		      //data : data,
		      success: function(data){
		         //$('#event_content').html("");
		          $('#admincontent').html(data);
		      },
		      async:false,        
		      dataType: 'html'
		    }); 

			
		});
	}


}