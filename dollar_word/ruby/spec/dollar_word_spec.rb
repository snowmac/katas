require 'spec_helper'
require 'dollar_word'

describe DollarWord do

  it 'returns default of 0 for no options given' do
    expect(DollarWord.compute({}).size).to eq(0)
  end

  context 'returns a correct word count' do
    it '0 words' do
      compute = DollarWord.compute({words: ''})
      expect(compute[:word_count]).to eq(0)
    end

    it '1 word' do
      compute = DollarWord.compute({words: 'adam'})
      expect(compute[:word_count]).to eq(1)
    end

    it '2 words' do
      compute = DollarWord.compute({words: 'adam bourg'})
      expect(compute[:word_count]).to eq(2)
    end

    it '3 words' do
      compute = DollarWord.compute({words: 'adam robert bourg'})
      expect(compute[:word_count]).to eq(3)
    end
  end

  context 'real dollar words' do
    it 'lower case example' do
      compute = DollarWord.compute({words: 'james bond was grumpy'})
      expect(compute[:word_count]).to eq(4)
      expect(compute[:dollar_words]).to eq(1)
    end

    it 'upper case example' do
      compute = DollarWord.compute({words: 'JAMES BOND WAS GRUMPY'})
      expect(compute[:word_count]).to eq(4)
      expect(compute[:dollar_words]).to eq(1)
    end

    it 'mixed case example' do
      compute = DollarWord.compute({words: 'James Bond Was GrUmPy'})
      expect(compute[:word_count]).to eq(4)
      expect(compute[:dollar_words]).to eq(1)
    end

    it 'many dollar words' do
      compute = DollarWord.compute({words: 'motors drossy toWers governS GrUmPy I love wild'})
      expect(compute[:word_count]).to eq(8)
      expect(compute[:dollar_words]).to eq(5)
    end
  end

end
