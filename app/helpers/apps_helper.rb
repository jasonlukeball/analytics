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


  def if_recent_span(datetime)
    if datetime > 30.minutes.ago
      output = "<span class='recent'>"
    else
      output = "<span>"
    end
    output += distance_of_time_in_words(datetime, Time.now )
    output += " ago"
    output += "</span>"
    output.html_safe
  end


end
