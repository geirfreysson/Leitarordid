require 'twitter_search'

class SearchController < ApplicationController

  def index
    unless params[:q].nil?
      if params[:lr]=='ordmyndir' && params[:q] !=~ /[^\w ]/
        @original_query = params[:q]
        query_strings = params[:q].split(" ")
        query_array = Array.new(query_strings)
        query_strings.each do |qs|
          query_array << Word.find_related_words_keep_article(qs)
        end
        logger.debug { "quary_array" + query_array.inspect }
        @query_human_view = query_array.flatten.uniq.join(" ")
        @query = query_array.flatten.join(" OR ").gsub(/['"]/,"")
      else
        @original_query = @query = @query_human_view = params[:q].gsub(/['"]/,"")
      end
    end
  end
  
  def twitter
    unless params[:q].nil?
      @client = TwitterSearch::Client.new('leitarordid.geirfreysson.com')
      @downsized = []
      if params[:lr]=='ordmyndir' && params[:q] !=~ /[^\w ]/
        @original_query = params[:q]
        query_strings = params[:q].split(" ")
        query_array = Array.new(query_strings)
        query_strings.each do |qs|
          query_array << Word.find_related_words_keep_article(qs)
        end
        @query_human_view = query_array.flatten.uniq.join(" ")
        @query = query_array.flatten.uniq
        @query = downsize(@query)
        @tweets = @client.query(@query)
      else
        @original_query = @query = @query_human_view = params[:q].gsub(/['"]/,"")
        @tweets = @client.query(params[:q])
      end
    end
  end
  
  #recursive function that ends up with a query of the right size
  def downsize(array,size=140)
    if array.join(" OR ").gsub(/['"]/,"").size > size
      @downsized << array.pop
      downsize(array,size)
    else
      return array.join(" OR ").gsub(/['"]/,"")
    end
  end
end
