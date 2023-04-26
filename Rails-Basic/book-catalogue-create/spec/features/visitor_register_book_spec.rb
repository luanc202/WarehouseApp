require 'rails_helper'

feature 'Visitor register book' do
  scenario 'successfully' do
    visit root_path
    click_on 'Registrar livro'
    fill_in 'Título', with: 'Quarto de Despejo: Diário de uma Favelada'
    fill_in 'Autora', with: 'Carolina Maria de Jesus'
    fill_in 'Ano de publicação', with: 1960
    fill_in 'Resumo', with: 'A obra é um fragmento do diário de Carolina Maria '\
                            'de Jesus, catadora de papel que viveu em uma '\
                            'favela na comunidade do Canindé. Apesar de '\
                            'publicado em 1960, revela tristes cenas '\
                            'cotidianas que não mudaram após 60 anos'
    fill_in 'Gênero', with: 'Biografia'
    click_on 'Enviar'

    expect(current_path).to eq book_path(Book.last)
    expect(page).to have_css('h1', text: 'Quarto de Despejo: Diário de uma Favelada')
    expect(page).to have_css('p', text: 'Carolina Maria de Jesus')
    expect(page).to have_css('p', text: '1960')
    expect(page).to have_css('p', text: 'A obra é um fragmento do diário de Carolina Maria '\
                                        'de Jesus, catadora de papel que viveu em uma '\
                                        'favela na comunidade do Canindé. Apesar de '\
                                        'publicado em 1960, revela tristes cenas '\
                                        'cotidianas que não mudaram após 60 anos')
    expect(page).to have_css('p', text: 'Biografia')
  end

  scenario 'and must fill all fields' do
    visit new_book_path
    fill_in 'Título', with: ''
    fill_in 'Autora', with: ''
    fill_in 'Ano de publicação', with: ''
    fill_in 'Resumo', with: ''
    fill_in 'Gênero', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Todos campos devem ser preenchidos')
  end
end


