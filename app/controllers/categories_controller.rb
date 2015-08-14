class CategoriesController < ApplicationController
  def index
    depth = params[:depth].presence || 1

    root = Category.roots.first
    categories = root.subtree.to_depth(depth).arrange_serializable

    render json: categories
  end

  def show
    depth = params[:depth].presence || 1

    root = Category.find(params[:id])
    categories = root.subtree.to_depth(depth).arrange_serializable

    render json: categories
  end
end
