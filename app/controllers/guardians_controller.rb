class GuardiansController < ApplicationController

  def index
    @student = Student.find(params[:student_id])
  end

  def create
    @student = Student.find(params[:student_id])
    @guardian = Guardian.create(guardian_params)
    if @guardian.save
      respond_to do |format|
        format.html { redirect_to :back, notice: "guardian successfully created!" }
        format.js {}
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, alert: @guardian.errors.full_messages.last }
        format.js {}
      end
    end
  end

  def edit
    @student = Student.find(params[:student_id])
    @guardian = Guardian.find(params[:id])
  end

  def update
    @student = Student.find(params[:student_id])
    @guardian = Guardian.create(guardian_params)
    if @guardian.update(guardian_params)
      respond_to do |format|
        format.html { redirect_to :back, notice: "guardian successfully updated!" }
        format.js {}
      end
    end
  end

  def destroy
    @guardian = Guardian.find(params[:id])
    @guardian.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: "guardian deleted!" }
      format.js {}
    end
  end

  private
  def guardian_params
    params.require(:guardian).permit(:student_id, :first_name, :last_name, :title, :address, :email, :day_phone, :evening_phone, :relationship)
  end

end
