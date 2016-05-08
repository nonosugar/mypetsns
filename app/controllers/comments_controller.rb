class CommentsController < ApplicationController
	def commentscreate
		@note = Note.find(params[note_id])
		@comment = current_user.comment.build(note_id:@note.id)
		@comment.save

		render 'notes/show'
	end
end
