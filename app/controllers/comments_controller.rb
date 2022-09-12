class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[ update destroy ]

  # POST /comments or /comments.json
  def create
    @comment = current_user.comments.create(comment_params)
    if @comment.save
      redirect_to @comment.post, notice: "Comment successfully created"
    else
      flash[:error] = "Cannot create this comment"
      redirect_to @comment.post
    end    
  end

  # TODO: Finalizar vista de update comentario
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO: Agregar botón de eliminar comentario en las cartas
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:text, :post_id)
    end
end
