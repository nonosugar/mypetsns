class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def relationsave
  	@user = User.find(params[:id])
  	relationship = current_user.relationships.build(followed_id: @user.id)
  	relationship.save
  	render 'users/show'
  end

  def relationdestroy
  	@user = User.find(params[:id])
  	relationship = current_user.relationships.find_by(followed_id: @user_id)
  	relationship.destroy
  	render 'users/show'
  end
end
