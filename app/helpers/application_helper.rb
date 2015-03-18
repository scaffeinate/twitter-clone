module ApplicationHelper

  def parse(content)
    #content.gsub(/(?:^|\W)@(\w+)/, link_to(" @#{'\1'}", '/users/\1'))
    content = content.gsub(/(?:\s|^)(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/i) do |match|
      link_to(match, '#', class: 'hashtags')
    end

    content.gsub(/(?:^|\W)@(\w+)/) do |match|
      link_to(match, user_path(match.gsub('@', '')), class: 'mention')
    end

  end

  def fetch_bg_img
    if user_signed_in?
      '/assets/background_home.jpg'
    else
      '/assets/img-1.jpg'
    end
  end
end
