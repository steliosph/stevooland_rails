class UserResourcesController < ApplicationController
  def new
  	UserResource.new
  end

  def create
  	@userResource = UserResource.new
  	if @userResource.save

  	else
  		 render 'new'
  		end

  end
end
