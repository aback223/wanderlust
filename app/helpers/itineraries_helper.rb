module ItinerariesHelper
  def itinerary_belongs_to_user(user)
    @itinerary.users.include?(user)
  end

  def show_date(object)
    object.strftime("%m/%d/%Y")
  end

  def grab_messages
    if @errors[:"images.itinerary"] || @errors[:images]
      @errors.delete(:"images.itinerary")
      @errors.delete(:images)
    end
  end
end