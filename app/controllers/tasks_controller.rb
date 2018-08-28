require 'sendgrid-ruby'
require 'mail'

class TasksController < ApplicationController
  def index
  end

  def send_email
    @task = Task.create(subject: params[:subject],email_to_send: params[:email_to_send],description: params[:description],href: params[:href],reproduce: params[:reproduce])

    CaseMailer.case_name(@task).deliver_now

   #  if @task.href === ""
   #   redirect_to "http://help.powerreviews.com"
   # else
   #   redirect_to "#{@task.href}"
   # end
    render html: { status: 'ok' }
  end


  private
  def task_params
    params.permit(:name,:email_to_send,:description,:href,:reproduce)
  end
end
