class LecturesController < InheritedResources::Base
  before_action :authenticate_user!,only: [:upvote, :downvote]
  # before_action :find_lect,only: [:edit]
  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.user_id = current_user.id


    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'course was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end


  end
  # def edit
  #   if current_user.id != @lecture.user_id
  #   redirect_to courses_path
  #   end
  # end
  def upvote
    @lecture = Lecture.find(params[:id])
    @lecture.upvote_from current_user
    redirect_to lecture_path
  end

  def downvote
    @lecture = Lecture.find(params[:id])
    @lecture.downvote_from current_user
    redirect_to lecture_path
  end
  private
    # def find_lect
    #   @lecture=Lecture.find(params[@lecture.id])
    # end
    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachment, :user_id, :course_id)
    end
end

