module SearchHelper
  def radio_checked?(name,params)
    if params[:lr] == name || (name=="ordmyndir" && (params.nil? || params[:lr].nil?))
      "checked=\"checked\""
    else
      ""
    end 
  end
end
