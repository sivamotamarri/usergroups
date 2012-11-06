module ApplicationHelper
  def lang
    if params[:locale] == 'CN'
      return 'zh-CN'
    else
      return params[:locale]
    end
  end

  def active_class(link, cont)
    if params[:action] == link && params[:controller] == cont
         "ulb-selected"
    elsif params[:controller].split('/')[0] == link
        "ulb-selected"
    else
       link
    end
  end

  def emails
    data = []
    User.all.each_with_index do |user,i|
       data[i] = { "label" => "#{user.email}", "value" => "#{user.id}"}
    end    
    data.to_json
  end
  
end
