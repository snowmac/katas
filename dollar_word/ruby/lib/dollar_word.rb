class DollarWord

  def self.compute(options)
    return {} if options.size <= 0
    words = options[:words].downcase.split(' ')

    total_words = words.size
    dollar_words = 0

    letter_positions = ("a".."z").to_a

    words.each do |word|
      word_price = 0
      word.split("").each do |char|
        word_price = letter_positions.index(char).to_i + 1 + word_price
      end

      if word_price == 100
        dollar_words += 1
      end

      word_count = 0
    end

    {
      word_count: total_words,
      dollar_words: dollar_words
    }
  end

end
