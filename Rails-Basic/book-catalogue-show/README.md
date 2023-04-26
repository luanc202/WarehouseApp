# Detalhes de um livro

## Vamos ver mais informações sobre um livro

Nossa aplicação está evoluindo, mas visitantes ainda não podem ver todas as
informações de um livro. Nesse desafio, você deve permitir que o título de um
livro na lista seja clicável e que essa ação leve para uma página onde é
possível ver, além dos dados da listagem, outras informações como:

- Resumo: `abstract:string`
- Gênero: `genre:string`

Para isso, você precisa criar um link para a página de detalhes de um livros.
Lembre de usar o método `link_to` e de receber o `id` do livro via *controller*.
Para adicionar atributos no *model* `Book`, você deve criar uma nova *migration*
usando o comando `rails generate migration add_attributes_to_book` informando os
atributos que deseja adicionar.

Além disso, queremos que você adicione um *link* na página de detalhes que
retorna para a página inicial ao ser clicado.

- [Active Record Migrations: creating a migration](https://guides.rubyonrails.org/active_record_migrations.html#creating-a-migration)
ou
- [Active Record Migrations: criando uma migration](https://guiarails.com.br/active_record_migrations.html#criando-uma-migration)
