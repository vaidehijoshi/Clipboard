class BuddyshipsController < ApplicationController

  def create
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

  private

  def buddyship_params
    params.require(:buddyship).permit(:student_id, :buddy_id, :course_section_id)
  end

end
