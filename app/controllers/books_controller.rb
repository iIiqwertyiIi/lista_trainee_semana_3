class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @authors = Author.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    begin
      @book.save!
      flash[:notice] = "Livro criado com sucesso."
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])


    begin
      @book.update!(book_params)
      flash[:notice] = "Livro editado com sucesso."
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to books_path
    end
  end

  def destroy
    @book = Book.find(params[:id])

    begin
      @book.destroy!
      flash[:notice] = "Livro deletado com sucesso."
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :year_of_publication, :author)
  end
end
