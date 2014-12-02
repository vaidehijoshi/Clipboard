class SchoolsController < ApplicationController
  def index
    @teacher = Teacher.new
  end
end
