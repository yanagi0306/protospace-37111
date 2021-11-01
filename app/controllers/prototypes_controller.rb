class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @prototype = Prototype.find(params[:id])
    @user = @prototype.user
    @comments = @prototype.comments.includes(:user)
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path

  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user.id == current_user.id
      redirect_to root_path

    end
  end

  def update
     @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(params[:id])
    else
      render :edit
    end
  end

  private

  def prototype_params
    params
      .require(:prototype)
      .permit(:title, :catch_copy, :concept, :image)
      .merge(user_id: current_user.id)
  end
end
