require 'sendgrid-ruby'
include SendGrid
class TasksController < ApplicationController
  def index
  end

  def send_email
    puts "-------------"
    # p params.to_h
    # p task_params
    # name = params[:name]
    # email = params[:email_to_send]
    # desc = params[:description]
    # p params[:name]
    @task = Task.create(name: params[:name],email_to_send: params[:email_to_send],description: params[:description])
    # @task = Task.create(params[:task])
    p @task
    # byebug
    from = Email.new(email: "#{@task.email_to_send}")
  to = Email.new(email: 'nicholasblock78@gmail.com')
  subject = "#{@task.name}"
  content = Content.new(type: 'text/plain', value: "#{@task.description}")
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: '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')
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers

    redirect_to root_url
  end

  private
  def task_params
    # params.require(:task).permit(:name,:email_to_send,:description)
    params.permit(:name,:email_to_send,:description)
    # params.permit(:name,:email_to_send,:description).to_h
  end
end
