class Word < ActiveRecord::Base
  set_table_name "bin"
  
  # the exclude array excludes words if the ordflokkur of the word is included in the exlusion filter 
  def self.find_related_words(word,exclude=[])
    w = Word.find_by_beygingarmynd(word)
    if w.nil?
      []
    else
      #all words that have the same word id as the search term
      related = Word.find_all_by_wordid_and_hluti(w.wordid,w.hluti)
      related.reject!{|i| exclude.include? i.ordflokkur}
      related.map{|i| i.beygingarmynd}
    end
  end
  
  #if the word is is definite article, only return definite article etc.
  def self.find_related_words_keep_article(word,exclude=[])
    w = Word.find_by_beygingarmynd(word)
    if w.nil?
      []
    else
      #all words that have the same word id as the search term
      related = Word.find_all_by_wordid_and_hluti(w.wordid,w.hluti)
      if w.greiningarstrengur.index /ET/
        related = related.select{|i| i.greiningarstrengur =~ /ET/}
      elsif w.greiningarstrengur.index /FT/
        related = related.select{|i| i.greiningarstrengur =~ /FT/}
      end
      related.reject!{|i| exclude.include? i.ordflokkur}
      related.map{|i| i.beygingarmynd}
    end
  end
  
  def self.find_root(word,related)
    for w in related
      if w.beygingarmynd == w.uppflettiord
        return w
      end
    end
    #last resort
    return related.first
  end
end