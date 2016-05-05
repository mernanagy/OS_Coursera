class CommentsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :lect
  def create
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @lecture
    else
      flash.now[:danger] = "error"
    end
  end



  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to lecture_path(@comment.lecture_id), notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    def lect
      @lecture=Lecture.find(params[:lecture_id])
    end
    def comment_params
      params.require(:comment).permit(:cont, :user_id, :lecture_id)
    end
    def set_comment
      @comment = Comment.find(params[:id])
    end
end

