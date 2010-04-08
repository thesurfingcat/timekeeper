# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def Format_dmyt(dateval)
    if dateval == nil
      msg = "Not set"
    else
      dateval.strftime '%d-%m-%Y %T (%a)'
    end
  end
  
end
