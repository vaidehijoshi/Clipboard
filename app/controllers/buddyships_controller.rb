class BuddyshipsController < ApplicationController
  def index
    @buddyships = Buddyship.all
  end

  def create
    # binding.pry
    @buddyship = Buddyship.create(buddyship_params)
    if @buddyship.save
      respond_to do |format|
        format.html { redirect_to :back, notice: "work buddies successfully created!" }
        format.js {}
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, alert: "oh noes!" }
        format.js {}
      end
    end
  end

  def destroy
    @buddyship = Buddyship.find(params[:id])
    @student = Student.find(@buddyship.student_id)
    @buddy = Student.find(@buddyship.buddy_id)
    @course_section = CourseSection.find(params[:class_id])
    @buddyship.destroy
    flash[:notice] = "#{@student.first_name} and #{@buddy.first_name} are no longer buddies in #{@course_section.name}"
    redirect_to(:back)
  end

  private

  def buddyship_params
    params.require(:buddyship).permit(:student_id, :buddy_id, :course_section_id)
  end

end
