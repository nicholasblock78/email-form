require 'sendgrid-ruby'
include SendGrid
class TasksController < ApplicationController
  def index
  end

  def send_email
    puts "-------------"
    @task = Task.create(name: params[:name],email_to_send: params[:email_to_send],description: params[:description],href: params[:href])
    p @task
    from = Email.new(email: "#{@task.email_to_send}")
    to = Email.new(email: 'nicholasblock78@gmail.com')
    subject = "#{@task.name}"
    content = Content.new(type: 'text/plain', value: "Directed from: #{@task.href}  Description: #{@task.description}")
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
    params.permit(:name,:email_to_send,:description,:href)
    # params.permit(:name,:email_to_send,:description).to_h
  end
end
