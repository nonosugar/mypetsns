class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def relationsave
  	@user = User.find(params[:user_id])
  	relationship = current_user.relationships.build(followed_id: @user.id)
  	relationship.save
    end

  def relationdestroy
  	@user = User.find(params[:user_id])
  	relationship = current_user.relationships.find_by(followed_id: @user.id)
  	relationship.destroy
  end
end
