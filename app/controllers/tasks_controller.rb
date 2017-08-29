require 'sendgrid-ruby'
class TasksController < ApplicationController
  def index
  end

  def send_email
    puts "-------------"
    @task = Task.create(subject: params[:subject],email_to_send: params[:email_to_send],description: params[:description],href: params[:href],reproduce: params[:reproduce])
    p @task
    from = SendGrid::Email.new(email: "#{@task.email_to_send}")
    to = SendGrid::Email.new(email: 'support@powerreviews.com')
    subject = "#{@task.subject}"
    content = SendGrid::Content.new(type: 'text/plain', value: "Directed from: #{@task.href} \n Description: #{@task.description} \n Steps to Reproduce: #{@task.reproduce}")
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers

    redirect_to root_url
  end

  private
  def task_params
    # params.require(:task).permit(:name,:email_to_send,:description)
    params.permit(:name,:email_to_send,:description,:href,:reproduce)
    # params.permit(:name,:email_to_send,:description).to_h
  end
end
