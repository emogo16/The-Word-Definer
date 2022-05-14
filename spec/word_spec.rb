require('rspec')
require('word')
require('definition')

describe ('Word') do
  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do 
    it('saves a word') do 
      word = Word.new('Sun', nil)
      word.save()
      word2 = Word.new('Pluto', nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new('Star', nil)
      word2 = Word.new('Star', nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("Sun", nil)
      word.save()
      word2 = Word.new("Star", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end
  
  describe('.find') do
    it("finds a word by id") do
      word = Word.new("Sun", nil)
      word.save()
      word2 = Word.new("Star", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new("Sun", nil)
      word.save()
      word.update("Star")
      expect(word.name).to(eq("Star"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new("Sun", nil)
      word.save()
      word2 = Word.new("Star", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([star]))
    end
  end

  describe('#definitions') do
    it("returns a word's definitions") do
      Definition.clear
      sun = Word.new("Sun", nil)
      sun.save()
      definition1 = Definition.new("The star around which the earth orbits", sun.id, nil)
      definition1.save()
      definition2 = Definition.new("The light or warmth received from the earth's sun", sun.id, nil)
      definition2.save()
      expect(sun.definitions).to(eq([definition1, definition2]))
    end
  end
end