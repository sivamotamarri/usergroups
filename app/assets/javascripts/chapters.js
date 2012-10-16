// Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
//var Usergroups = Usergroups || {};
Chapters ={
	
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
      }
      $(this).children("li").each(function(i, element){
      	$(element).removeClass(selectedClass);
      });
      $(e.target).parent("li").addClass(selectedClass);
    });

}
   

}