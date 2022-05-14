require('rspec')
require('definition')
require('word')
require('pry')

describe ('Definition') do
  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("In Rainbows", nil)
    @word.save()
  end
