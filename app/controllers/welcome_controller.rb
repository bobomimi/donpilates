class WelcomeController < ApplicationController
  def index
  	@posts = Post.all
  	@products = Product.all
  end
  def about
  end
end
