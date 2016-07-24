module AppsHelper

  def app_nav_item_div(current_page, title)
    if current_page
      output = "<div class='app-nav-item app-nav-item-active'>"
    else
      output = "<div class='app-nav-item'>"
    end
    output += title
    output += "</div>"
    output.html_safe
  end

end
