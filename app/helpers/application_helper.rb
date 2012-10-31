module ApplicationHelper
  def lang
    if params[:locale] == 'CN'
      return 'zh-CN'
    else
      return params[:locale]
    end
  end

  def active_class(link,cont)
    if params[:action] == link && params[:controller] == cont
         "ulb-selected"
    elsif params[:controller].split('/')[0] == link
        "ulb-selected"
    else
       link
    end
  end
end
