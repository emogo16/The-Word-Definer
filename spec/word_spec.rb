require('rspec')
require('word')
require('definition')

describe ('Word') do
  before(:each) do
    Word.clear()
  end



  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Word.all).to(eq([]))
    end
  end