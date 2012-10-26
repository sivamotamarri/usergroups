module ApplicationHelper
  def lang
    if params[:locale] == 'CN'
      return 'zh-CN'
    else
      return params[:locale]
    end
  end
end
