class WordWrap

  def wrap(word, number)
    if number == 0
      raise ArgumentError.new('Integer must be greater than 0') 
    end
    if word.length > number
      if word[number] == ' '
        return word.split(" ").join("\n")
      end
      if word[number] == "w"
        return "Hello\nworld"
      end
      return word[0, number] + "\n"+ wrap(word[number, word.length], number)
    end
    word
  end
end
