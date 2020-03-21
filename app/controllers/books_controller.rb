class BooksController < ApplicationController
  #before_action :set_book, only: [:show, :edit, :update, :destroy, :library]
  #before_action :authenticate_user!, except: [:index, :show]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
    #@book = current_user.books.build
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    #@book.user = current_user
    if @book.save
      flash[:success] = "Book has been added"
      redirect_to book_path(@book)
    else
      flash.now[:danger] = "Error! Please try again"
      render 'new'
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book = Book.find(params[:id])
    if @book.update(todo_params)
      flash[:success] = "Book was Updated"
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:danger] = "Book has been removed"
    redirect_to books_path
  end

  # Add and remove books to library
  # for current_user
  def library
    type = params[:type]

    if type == "add"
      current_user.library_additions << @book
      redirect_to library_index_path, notice: "#{@book.title} was added to your library"

    elsif type == "remove"
      current_user.library_additions.delete(@book)
      redirect_to root_path, notice: "#{@book.title} was removed from your library"
    else
      # Type missing, nothing happens
      redirect_to book_path(@book), notice: "Looks like nothing happened. Try once more!"
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :description, :author, :thumbnail, :user_id)
    end
end
