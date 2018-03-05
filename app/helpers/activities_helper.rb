module ActivitiesHelper
  def list_helper(c, object)
    if object
      if c != object.categories.last && c.name.present?
        ","
      end
    end
  end
end