module ApplicationHelper
  def hilite_when(format)
    params[:format] == format ? "hilite" : ""
  end
end
