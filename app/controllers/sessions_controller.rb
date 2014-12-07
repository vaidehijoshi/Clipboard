class SessionsController < ApplicationController
  def create
    if params[:teacher][:email].present?
      teacher = Teacher.find_by(:email => params[:teacher][:email]) || Teacher.create(:email => params[:teacher][:email])
      if teacher
        session[:teacher_id] = teacher.id
        redirect_to root_path
      else
        flash[:notice] = "Could not find that person, sorry!"
        redirect_to root_path
      end
    else
      flash[:notice] = "You must enter your email to log in."
      redirect_to root_path
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to root_path
  end
end
