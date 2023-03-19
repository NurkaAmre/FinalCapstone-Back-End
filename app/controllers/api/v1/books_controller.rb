class Api::V1::BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find_by(id: params[:id])
    if @book.nil?
      render json: { message: 'Book with the Id does not exist' }, status: 404
    else
      render json: @book
    end
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: { message: 'Book was successfully created' }, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      render json: { message: 'Book was successfully deleted' }, status: :no_content
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :publisher, :date_of_publication, :pages,
                                 :language, :isbn, :price, book_cover_images: {})
  end
end
