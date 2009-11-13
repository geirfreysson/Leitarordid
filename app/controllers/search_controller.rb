class SearchController < ApplicationController

  def index
    unless params[:q].nil?
      if params[:lr]=='ordmyndir' && params[:q] !=~ /[^\w ]/
        @original_query = params[:q]
        query_strings = params[:q].split(" ")
        query_array = Array.new(query_strings)
        query_strings.each do |qs|
          query_array << Word.find_related_words(qs)
        end
        logger.debug { "quary_array" + query_array.inspect }
        @query_human_view = query_array.flatten.uniq.join(" ")
        @query = query_array.flatten.join(" OR ").gsub(/['"]/,"")
      else
        @original_query = @query = @query_human_view = params[:q].gsub(/['"]/,"")
      end
    end
  end
end
