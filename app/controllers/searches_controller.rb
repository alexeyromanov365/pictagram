class SearchesController < ApplicationController
  def search
    if params[:search].present?
      @albums = Album.search(params[:search]).order(created_at: :desc)
      @tags = Tag.search(params[:search]).order("created_at DESC")
    end
  end
end