class TeachersController < ApplicationController
  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.create(teacher_params)
    session[:teacher_id] = @teacher.id
    redirect_to teacher_path(@teacher)
  end

  private

    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :title, :email)
    end
end
