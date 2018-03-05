module ItinerariesHelper
  def itinerary_belongs_to_user(user)
    @itinerary.users.include?(user)
  end

  def show_date(object)
    object.strftime("%m/%d/%Y")
  end

  def image_errors_if_exists
    if @errors[:images]
      @errors.delete(:images)
      "<li>Image links need to be present with .gif/.jpg/.png format</li>".html_safe
    end
  end
end