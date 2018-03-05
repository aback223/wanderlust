module ActivitiesHelper
  def showCategories(c)
    if @activity
      if c != @activity.categories.last && c.name.present?
        ","
      end
    end
  end
end