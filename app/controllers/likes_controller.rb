class LikesController < ApplicationController
	def create
		@note = Note.find(params[:note_id])
		@like = current_user.likes.build(note_id:@note.id)
		@like.save
		render 'notes/show'
	end

	def destroy
		@note = Note.find(params[:note_id])
		like = current_user.likes.find_by(note_id: @note.id)
		like.destroy
		render 'notes/show'
	end
end
