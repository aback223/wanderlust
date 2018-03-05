module ActivitiesHelper
  def list_helper(c, object)
    if object
      if !c.name.empty?
        "."
      end
    end
  end
end