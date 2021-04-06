class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def show
    find_account
    find_category
  end
  
  
  private

  def find_category
    @category = Category.find(params[:category_id])
  end
  
  def find_account
    @account = Account.find(params[:account_id])
  end
end
