class WordWrap

  def wrap(word, number)
    if number == 0
      raise ArgumentError.new('Integer must be greater than 0') 
    end
    if word.length > number
      word.insert(number, "\n")
    end
    word
  end
end
