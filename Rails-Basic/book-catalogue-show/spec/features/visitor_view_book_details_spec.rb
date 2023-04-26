require 'rails_helper'

feature 'Visitor views book details' do
  scenario 'successfully' do
    book = Book.create(title: 'Orgulho e Preconceito',
                       author: 'Jane Austen',
                       publication_year: 1813,
                       abstract: 'Um clássico da literatura inglesa centrato no '\
                                 'relacionamento turbulento entre Elizabeth '\
                                 'Bennet, a filha de um cavalheiro e '\
                                 'Fitzwilliam Darcy, um aristocrata.',
                       genre: 'Romance')

    visit root_path
    click_on 'Orgulho e Preconceito'

    expect(current_path).to eq book_path(book)
    expect(page).to have_css('h1', text: book.title)
    expect(page).to have_css('p', text: book.author)
    expect(page).to have_css('p', text: book.publication_year)
    expect(page).to have_css('p', text: book.abstract)
    expect(page).to have_css('p', text: book.genre)
  end

  scenario 'and returns to home page' do
    book = Book.create(title: 'Orgulho e Preconceito',
                       author: 'Jane Austen',
                       publication_year: 1813,
                       abstract: 'Um clássico da literatura inglesa centrato no '\
                                 'relacionamento turbulento entre Elizabeth '\
                                 'Bennet, a filha de um cavalheiro e '\
                                 'Fitzwilliam Darcy, um aristocrata.',
                       genre: 'Romance')

    visit book_path(book)
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
