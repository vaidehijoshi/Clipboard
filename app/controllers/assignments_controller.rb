class AssignmentsController < ApplicationController
  def show
    @scores = {}
    @assignment = Assignment.find(params[:id])
    @assignment.students.each do |student|
      @scores[student.id] = Score.find_or_create_by(student_id: student.id, assignment_id: @assignment.id)
    end
  end

  def create
    binding.pry
    Assignment.create(name: params[:name], points: params[:points], date_assigned: params[:date_assigned], date_due: params[:date_due], course_section_id: params[:class_id], category: params[:category], document: params[:document])
    redirect_to(:back)
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def remove_document
    #binding.pry
    @assignment = Assignment.find(params[:assignment_id])
    @assignment.document = nil
    @assignment.save
    flash[:notice] = 'The document has been removed.'
    redirect_to(:back)
  end

  def update
    
    @assignment = Assignment.find(params[:id])
    if params[:date_assigned] != ""
      @assignment.update(date_assigned: params[:date_assigned])
    end
    if params[:date_due] != ""
      @assignment.update(date_due: params[:date_due])
    end
   
    if params[:assignment]
      if params[:assignment][:document]
        @assignment.update(document: params[:assignment][:document])
      end
    else
      @assignment.update(name: params[:name], points: params[:points], category: params[:category])
    end
    if @assignment.save
      flash[:notice] = "Assignment successfully updated!"
      redirect_to(:back)
    else
      flash[:alert] = "Update failed!"
      redirect_to(:back)
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to(:back)
  end

end
