class CoursesController < InheritedResources::Base
  before_action :authenticate_user!
  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id


    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end


  end
  private

    def course_params
      params.require(:course).permit(:title, :image, :desc, :user_id)
    end

end

