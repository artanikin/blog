class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy ]

  def index
    @categories = Category.all
  end

  def show
    @posts = Post.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
    @categories = Category.all.order(:name)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: 'Категория успешно создана'
    else
      @categories = Category.all.order(:name)
      flash[:danger] = 'Категория не создана'
      render :new
    end
  end

  def edit
    @categories = Category.where("id != #{@category.id}").order(:name)
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to categories_path, success: 'Категория успешно обновлена'
    else
      @categories = Category.where("id != #{@category.id}").order(:name)
      flash[:danger] = 'Категория не обновлена'
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, success: 'Категория успешно удалена'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
