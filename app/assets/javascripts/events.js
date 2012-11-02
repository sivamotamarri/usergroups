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
            $('#events').html(data);            
        },
        async:false,        
        dataType: 'html'
      });
    
  });

  $('.event_expand').die('click').live('click', function(e){    
     e.preventDefault();
     var data = {event_id: $(this).attr('event_id')};    
     $.ajax({
        context: this,
        url: '/events/full_event_content',
        data : data,
        success: function(data){            
            $(this).parent().parent().replaceWith(data);            
        },
        async:false,        
        dataType: 'html'
      });

  }); 

  $('#upcoming_events').die('click').live('click', function(e){    
  	e.preventDefault();
    var default_text= "See all upcoming events...";
  	$('#two_events').toggle();
  	$('#all_events').toggle();
    if($('#two_events').is(':hidden')){
      default_text = "collapse"
    }
    $('#upcoming_events').text(default_text);

  });	
  

  }

}