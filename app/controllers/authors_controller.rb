class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @books = Book.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    begin
      @author.save!
      flash[:notice] = "Autor criado com sucesso."
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to authors_path
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])


    begin
      @author.update!(author_params)
      flash[:notice] = "Autor editado com sucesso."
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to authors_path
    end
  end

  def destroy
    @author = Author.find(params[:id])

    begin
      @author.destroy!
      flash[:notice] = "Autor deletado com sucesso."
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to authors_path
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :year_of_birth, :birthplace)
  end
end
