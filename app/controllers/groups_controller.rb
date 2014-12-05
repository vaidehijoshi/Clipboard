class GroupsController < ApplicationController
  def index
    if params[:group_size]
      @course_section = CourseSection.find(params[:class_id])
      @groups = @course_section.make_groups_of(params[:group_size].to_i)
    end
  end

  def create
  end
end
