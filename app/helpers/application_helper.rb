module ApplicationHelper
  def fetch_bg_img
    if user_signed_in?
      '/assets/background_home.jpg'
    else
      '/assets/img-1.jpg'
    end
  end
end
