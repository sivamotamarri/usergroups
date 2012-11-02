require 'will_paginate/view_helpers/action_view'

class RemoteLinkRenderer < ::WillPaginate::ActionView::LinkRenderer

  
  protected

  def html_container(html)   
    tag :div, tag(:ul, tag(:label, "Page", :class=>'label-28') + html), container_attributes
  end

  def page_number(page)
    tag :span, link(page, page, :rel => rel_value(page), :class => ('pgtbar-selected' if page == current_page))
  end

  def gap
    tag :span, link(super, '#'), :class => 'disabled'
  end

  def previous_or_next_page(page, text, classname)
   
    if page
       if text  == "&lt; PREVIOUS"
         tag :span, link(text, page,:class =>'flt-right1',:style=>'margin-right:30px;'   || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
       else
         tag :span, link(text, page,:class =>'flt-right1',:style=>'margin-left:30px;'  || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
       end
    else
        if text  == "&lt; PREVIOUS"          
         tag :span, link(text, '#',:class =>'flt-right1',:style=>'margin-right:30px;' ), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
        else
         tag(:span, text, :class => 'flt-right1' + ' disabled',:style=>'margin-left:30px;')
        end
    end
    #tag :span, link(text, page,:class =>'flt-right',:style=>'margin-left:30px;'  || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
  end

  def link(text, target, attributes = {})
  attributes["data-remote"] = true
  super
  end
  
end

def page_navigation_links(pages)
  will_paginate(pages, :class => 'pgt-bar', :inner_window => 2, :outer_window => 0, :renderer => RemoteLinkRenderer, :previous_label => '&larr;'.html_safe, :next_label => '&rarr;'.html_safe)
end



