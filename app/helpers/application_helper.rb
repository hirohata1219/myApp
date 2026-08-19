module ApplicationHelper
  def page_title(title)
    if title.present?
      "#{title} | myApp"
    else
      "myApp"
    end
  end
end
