class CourseSectionsController < ApplicationController
  def show
    @class = CourseSection.find(params[:id])
  end
end
