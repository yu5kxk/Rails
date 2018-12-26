class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:new, :show]

	def index
	end

	def new
		@book = Book.new
		@books = Book.all
		@user = current_user
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id #ログインしているidに保存
		  if @book.save
		  	flash[:notice] = "Post was successfully created."
		    redirect_to book_path(@book.id)
		  else
			@books = Book.all #newの内容
			@user = current_user #newの内容
		  	render :new #エラーが出た場合newに戻る。newの内容を必ず前に記述してあげる
		end
	end

	def show
		@book = Book.find(params[:id])
		@user = current_user
		@books = Book.new
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user != current_user
			redirect_to new_book_path
		end
	end

	def update
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to book_path(book.id)
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to new_book_path
	end


	private

	def book_params
		params.require(:book).permit(:title, :body)
	end
end
