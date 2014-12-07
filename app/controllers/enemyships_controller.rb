class EnemyshipsController < ApplicationController

  def create
    @enemyship = Enemyship.create(enemyship_params)
    if @enemyship.save
      respond_to do |format|
        format.html { redirect_to :back, notice: "work enemies successfully created!" }
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
    @enemyship = Enemyship.find(params[:id])
    @student = Student.find(@enemyship.student_id)
    @enemy = Student.find(@enemyship.enemy_id)
    @course_section = CourseSection.find(params[:class_id])
    @enemyship.destroy
    flash[:notice] = "#{@student.first_name} and #{@enemy.first_name} are no longer non work buddies in #{@course_section.name}"
    redirect_to(:back)
  end

  private

  def enemyship_params
    params.require(:enemyship).permit(:student_id, :enemy_id, :course_section_id)
  end

end
