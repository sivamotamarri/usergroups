// Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
//var Usergroups = Usergroups || {};
Chapters ={  

renderEvents: function(element){
   // Changing chapter status      
      var data = {chapter_id: element.attr('id')};    
      
      $.ajax({
        url: '/events/userevents',
        data : data,
        success: function(data){
            $('#event_content').html(data);
            // $('#groupadmin').html("");
        },
        async:false,        
        dataType: 'html'
      });
    
  },
renderChapterAdmin: function(element){
 // Changing chapter status      
    var data = {chapter_id: element.attr('chapter_id')};    
    
    $.ajax({
      url: '/chapters/chapter_admin_home_page',
      data : data,
      success: function(data){
         //$('#event_content').html("");
          $('#event_content').html(data);
      },
      async:false,        
      dataType: 'html'
    });
  
},  

 init: function(){
	$( "#profiletabs").tabs({
    	beforeLoad: function( event, ui ) {    
    		ui.jqXHR.error(function() {
      		ui.panel.html("Couldn't load this tab. We'll try to fix this as soon as possible. " +    "If this wouldn't be a demo." );});
         }
      });
    //userprofile jquery
    $('.ul-f, .ul-i').unbind('click').bind('click', function(e){          
      e.preventDefault();
      var selectedClass="ulf-selected";

      if($(this).hasClass('ul-i')){
      	selectedClass="uli-selected";
        Chapters.renderEvents($(e.target));
      }      
      if($(e.target).text() == "Group Admin"){
        $($('.profile_content')[0]).hide();
        Chapters.renderChapterAdmin($(e.target))
      }else if($(e.target).text() == "Events" || $(e.target).text() == "Photos" || $(e.target).text() == "Post"){
        $($('.profile_content')[0]).show();
        $('#event_content').html("");
      }      

      
      $(this).children("li").each(function(i, element){
      	$(element).removeClass(selectedClass);
      });
      $(e.target).parent("li").addClass(selectedClass);
      
    });


}



}