class TasksController < ApplicationController
  def index
  end

  def send_email
    puts "-------------"
    p params[:name]
    # @task = Task.create(params[:name],params[:email_to_send],params[:description])
    @task = Task.create(params[:task])
    p @task
    # byebug

    redirect_to root_url
  end

  private
  def task_params
    params.require(:task).permit(:name,:email_to_send,:description)
    # params.permit(:name,:email_to_send,:description).to_h
  end
end
