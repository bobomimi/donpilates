class WelcomeController < ApplicationController
  def index
  	@posts = Post.all
  	@products = Product.all
  	@contact = Contact.new
  end
  def about
  end
end
