# Class for controller Category model
class CategoriesController < ApplicationController
  before_action :set_category, only: [:destroy]

  def index
    @categories = Category.where(user_id: current_user)
  end

  def create
    @category = Category.new(params_category)
    if @category.save
      @notice = "Categoria #{@category.name} salva com sucesso"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @category.destroy
      @notice = "Categoria #{@category.name} excluir com sucesso"
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def params_category
    params.require(:category).permit(:name, :user_id)
  end

end
