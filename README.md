# Good_Books [![Code Climate](https://codeclimate.com/github/yuriferreira/good_books/badges/gpa.svg)](https://codeclimate.com/github/yuriferreira/good_books) [![Test Coverage](https://codeclimate.com/github/yuriferreira/good_books/badges/coverage.svg)](https://codeclimate.com/github/yuriferreira/good_books/coverage)


*Good_Books* O principal objetivo é fazer a avaliação de livros com suporte a thread de comentários likes etc. Demo http://goodbooks4devs.herokuapp.com/

## Instalação

Baixe o repositório

    git clone git@github.com:yuriferreira/good_books.git

Instale as dependências

    bundle install

Configure o banco de dados

    rake db:create
    rake db:migrate
    rake db:seed ( Aqui é criado um usuário [ usertest@gmail.com/12345678 ])

Rode os testes :+1:

    rspec

Rode a aplicação :grin:

    rails s
