class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end
  def index
    @note = Note.find(params[:note_id])
    @users = @note.liking_users
    @title = 'いいねしたユーザー一覧'
  end

  def follow_index
    @user = User.find(params[:user_id])
    @users = @user.followed_users
    @title = 'フォロー'
    render :index
  end 

  def follower_index
    @user = User.find(params[:user_id])
    @users = @user.followers
    @title = 'フォロアー'
    render :index
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
