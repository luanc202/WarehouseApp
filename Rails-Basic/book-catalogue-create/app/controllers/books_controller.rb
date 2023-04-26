class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def create
    if params[:book].each_value.all?(&:present?)
      book = Book.new(title: params[:book][:title],
                      author: params[:book][:author],
                      publication_year: params[:book][:publication_year],
                      abstract: params[:book][:abstract],
                      genre: params[:book][:genre])
      return redirect_to book_path(book.id) if book.save
    end
    flash[:fail] = "Todos campos devem ser preenchidos"
    render :new
  end

  def new
    @book = Book.new
  end
end
