class BooksController < ApplicationController
  def top
  end

  def index
      @book = Book.new
      @books = Book.all
  end

  def show
      @show = Book.find(params[:id])
  end

  def edit
      @show = Book.find(params[:id])
  end

  def update
      book =Book.find(params[:id])
      book.update(book_params)
      redirect_to book_path(book.id), notice: 'Book was successfully created.'
  end

  def create
      book = Book.new (book_params)
      book.save
  	  redirect_to book_path(book.id), notice: 'Book was successfully created.'
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body)
  end
end
