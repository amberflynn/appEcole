class PagesController < ApplicationController
  def about
  end

  def welcome
  	 @posts = Post.all.sort_by_newest
  end
end
