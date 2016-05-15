class CommentsController < ApplicationController
	# def create
	# 	@note = Note.find(params[:note_id])
	# 	@comment = current_user.comments.build(note_id: @note.id)
	# 	@comment.save
	# 	@comments = @note.comments
	# 	render 'notes/show'
	# end

	def commentscreate
	  @note = Note.find(params[:note_id])
	  @comment = current_user.comments.build(note_id:@note.id)
	  @comment.content = params[:content]
	  @comment.save
	  render 'notes/show'
	end

	def commentsdestroy
		@comment = Comment.find(params[:comment_id])
		@note = @comment.note
		@comment.destroy
		render 'notes/show'
	end

end
