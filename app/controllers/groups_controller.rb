class GroupsController < ApplicationController
  def index
    @kids_sitting_with_buddies_counter = 0
    @course_section = CourseSection.find(params[:class_id])
    if params[:group_size]   
      @groups = @course_section.optimized_grouping(params[:group_size].to_i)
      @placed_kids = @groups[:groups]
      @unplaced_kids = @groups[:unplaceable]
      @group = @course_section.groups.new
      @teacher = @course_section.teacher
    else
      @groups = @course_section.groups
      render :show
    end
  end

  def create
    @course_section = CourseSection.find(params[:class_id])
    @course_section.groups.destroy_all
    params[:groups].each do |k, student_ids|
      g = @course_section.groups.new
      g.student_ids = student_ids
      g.save
    end
    redirect_to teacher_class_groups_path(@course_section.teacher, @course_section)
  end

end
