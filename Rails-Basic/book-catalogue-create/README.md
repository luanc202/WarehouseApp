# Registrando livros
--------------------
## Vamos cadastrar novos livros, mas nenhum campo pode ficar vazio!

Nossa aplicação já conta com a página inicial, em que um visitante vê uma lista
de livros, e uma página de detalhes, onde estão contidas mais informações.
Agora, esperamos que você implemente no sistema um formuláário para cadastrar novos
livros com as informações a seguir:

- Título: `title:string`
- Autora: `author:string`
- Ano de publicação: `publication_year:integer`
- Resumo: `abstract:string`
- Gênero: `genre:string`

Para estruturar o formulário de cadastro, você pode usar o método `form_for` na
*view* `new`. Lembre que você pode consultar a documentação oficial do Ruby on
Rails:

- [Binding a Form to an Object](https://guides.rubyonrails.org/v5.2/form_helpers.html#binding-a-form-to-an-object)


Depois de concluir o primeiro teste deste desafio, visitantes já são capazes
de cadastrar livros na plataforma. No entanto, se uma pessoa tenta registrar um
livro deixando o campo de título em branco, um livro sem título é cadastrado!

Seria interessante que a aplicação não permitisse registro de livros com campos
vazios, afinal queremos informações completas. Para resolver esse problema, você
deverá implementar validações em Ruby on Rails e usar Flash para renderizar uma
mensagem na *view* do próprio formulário.

- [Active Record Validations](https://guides.rubyonrails.org/active_record_validations.html)
- [Active Record Validations: Displaying Validation Errors in Views](https://guides.rubyonrails.org/active_record_validations.html#displaying-validation-errors-in-views)
- [Action Controller Overview: The Flash](https://guides.rubyonrails.org/action_controller_overview.html#the-flash)

