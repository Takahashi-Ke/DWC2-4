class SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    search = params[:search]
    @keyword = params[:keyword]
    
    if @range == "1"
      @title = 'Users'
      @users = User.search(search, @keyword)
    else
      @title = 'Books'
      @books = Book.search(search, @keyword)
    end
  end
  
end
