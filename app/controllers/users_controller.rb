class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # index, show, new, edit, create, update, distroy
  # nog geen destroy, volgorde van maken in de lessen
  # destroy toegevoegd na implementeren van inlog-functionaliteit

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Alpha Blog, #{@user.username}!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    #@user = User.find(params[:id])
  end

  def update
    #@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your Account was successfully updated!"
      redirect_to articles_path
    else
      render 'edit'
    end  
  end

  def show
    #@user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 3 )
  end

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all their articles have been deleted"
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end 

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    #if !logged_in? || current_user != @user # !logged_in? is overbodig vergelijken met
    #if current_user != @user
    if !(current_user == @user || current_user.admin?)
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end

  def require_admin
    if !logged_in? || !current_user.admin?
    # current_user.admin? alleen veroorzaakt een fout als current_user nil is
    # als current_user nil is, dan is de bezoeker niet ingelogd, dus !logged_in? is true
    # het if-statement genereert geen fout omdat het tweede deel van de of-conditie
    # niet meer gecheckt hoeft te worden
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end

end