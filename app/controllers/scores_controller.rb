class ScoresController < ApplicationController
  def create
    @score = Score.create(score_params)
    @assignment = @score.assignment
    if @saved = @score.save
      @score_path = score_path(@score)
      respond_to do |format|
        format.html { redirect_to :back, notice: "#{@score.student.full_name} earned #{@score.points_earned} points" }
        format.js {  }
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, notice: "Score could not be saved." }
        format.js {  }
      end
    end
  end

  def update
    @score = Score.find(params[:id])
    @assignment = @score.assignment
    if @updated = @score.update(score_params)
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

  def destroy
    @score = Score.find(params[:id])
    @assignment = @score.assignment
    @score.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: "Score reset." }
      format.js {  }
    end
  end

  private
    def score_params
      params.require(:score).permit(:student_id, :assignment_id, :points_earned)
    end
end
