class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]

  def index
    @parents = Parent.all
  end

  def new
    @parent = Parent.new
  end

  def show
    redirect_to parents_path
  end

  def edit
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      redirect_to @parent, notice: 'Parent was successfully created.'
    else
      render :new
    end
  end

  def update
    if @parent.update(parent_params)
      redirect_to @parent, notice: 'Parent was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @parent.destroy
    redirect_to parents_path notice: 'Parent was successfully deleted.'
  end

  private

  def set_parent
    @parent = Parent.find(params[:id])
  end

  def parent_params
    params.require(:parent).permit(:name, :email, :password, :teacher_id)
  end
end