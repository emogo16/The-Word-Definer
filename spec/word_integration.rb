require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('Creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'Sun')
    click_on('Go!')
    expect(page).to have_content('Sun')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    word = Word.new("Sun", nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'Star')
    click_on('Definition')
    expect(page).to have_content('Star')
  end
end

describe('update a word', {:type => :feature}) do
  it("updates a word and returns to word page") do
    word = Word.new("Pluto", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on("Edit Word")
    fill_in('Change Word', :with => "Dwarf planet")
    click_on('Update')
    expect(page).to have_content('Dwarf planet')
  end
end

describe('edit a definition', {:type => :feature}) do
  it("edits a words definition and returns to word page") do
    word = Word.new("Saturn", nil)
    word.save()
    definition = Definition.new("sixth planet from the Sun", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    fill_in("Definition", :with => "known as the most beautiful planet")
    click_on("Update")
    expect(page).to have_content("known as the most beautiful planet")
  end
end

describe('delete a word', {:type => :feature}) do
  it("deletes a word and returns to word page") do
    word = Word.new("Saturn", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on("Edit Word")
    click_on("Delete Word")
    expect(page).to have_content("")
  end
end

describe("deletes a definition", { :type => :feature }) do
  it("delete a definition and return to word page") do
    word = Word.new("Saturn", nil)
    word.save()
    definition = Definition.new("known as the most beautiful planet", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    click_on("Delete")
    expect(page).to have_content("")
  end
end