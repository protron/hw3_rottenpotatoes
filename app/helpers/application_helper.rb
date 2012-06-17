module ApplicationHelper
  def hilite_when(format)
    params[:order] == format ? "hilite" : ""
  end
  def current_url(newParams={})
    params.merge(newParams)
  end
end
