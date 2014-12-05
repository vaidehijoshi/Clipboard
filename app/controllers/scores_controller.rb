class ScoresController < ApplicationController
  def create
    @score = Score.create(score_params)
    if @score.save
      flash[:notice] = "#{@score.student.full_name} earned #{@score.points_earned} points"
      redirect_to(:back)
    else
      flash[:alert] = "Score could not be created!"
      redirect_to(:back)
    end
  end

  def update
    @score = Score.find(params[:id])
    @score.update(score_params)
    if @score.save
      flash[:notice] = "#{@score.student.full_name} earned #{@score.points_earned} points"
      redirect_to(:back)
    else
      flash[:alert] = "Score could not be updated!"
      redirect_to(:back)
    end
  end

  private
    def score_params
      params.require(:score).permit(:student_id, :assignment_id, :points_earned)
    end
end
