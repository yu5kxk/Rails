class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
  	@users = User.all
  	@book = Book.new
    @user = current_user
  end

  def show
  	@user = User.find(params[:id])
  	@user_books = @user.books
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Post was successfully created."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def new #aboutページ
  end

  private
  def user_params
  	params.require(:user).permit(:name, :user_image, :introduction)
  end

end
