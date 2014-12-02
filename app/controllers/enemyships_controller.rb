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

  private

  def enemyship_params
    params.require(:enemyship).permit(:student_id, :enemy_id, :course_section_id)
  end

end
