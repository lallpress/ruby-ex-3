module FunWithStrings
  def palindrome?
    self.downcase!
    self.gsub!(/\W/, "")
    self == self.reverse ? true : false
  end
  def count_words
    self.downcase!
    words = self.split
    word_count = {}
    words.map!{ |word| word.gsub(/\W/,"") }
    words.reject!{|word| word == ""}
    words.each {|word| word_count.key?(word) ? (word_count[word] +=1) : (word_count[word] = 1) }
    return word_count
  end  
  def anagram_groups
    words = self.split
    groups = []
    words.each do |word|
      sub_array = words.select { |second_word| word.downcase.chars.sort == second_word.downcase.chars.sort }
      words = words - sub_array
      groups.push(sub_array)
    end
    return groups
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end