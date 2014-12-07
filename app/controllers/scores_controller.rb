class ScoresController < ApplicationController
  def create
    @score = Score.create(score_params)
    @assignment = @score.assignment
    if @score.save
      respond_to do |format|
        format.html { redirect_to :back, notice: "#{@score.student.full_name} earned #{@score.points_earned} points" }
        format.js {  }
      end
    else
      flash[:alert] = "Score could not be created!"
      redirect_to(:back)
    end
  end

  def update
    @score = Score.find(params[:id])
    @assignment = @score.assignment
    @score.update(score_params)
    if @score.save
      respond_to do |format|
        format.html { redirect_to :back, notice: "#{@score.student.full_name} earned #{@score.points_earned} points" }
        format.js {  }
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, notice: "Score could not be updated!" }
        format.js {  }
      end
    end
  end

  private
    def score_params
      params.require(:score).permit(:student_id, :assignment_id, :points_earned)
    end
end
