require 'sendgrid-ruby'
require 'mail'

class TasksController < ApplicationController
  def index
  end

  # def send_email
  #   puts "-------------"
  #   @task = Task.create(subject: params[:subject],email_to_send: params[:email_to_send],description: params[:description],href: params[:href],reproduce: params[:reproduce])
  #   p @task
  #   from = SendGrid::Email.new(email: "#{@task.email_to_send}")
  #   to = SendGrid::Email.new(email: 'support@powerreviews.com')
  #   subject = "#{@task.subject}"
  #   content = SendGrid::Content.new(type: 'text/plain', value: "Case opened from help.powerreviews.com \n Description: \n#{@task.description} \n Steps to Reproduce: \n#{@task.reproduce}")
  #   mail = SendGrid::Mail.new(from, subject, to, content)
  #
  #   sg = SendGrid::API.new(api_key: ENV['SENDGRID_KEY'])
  #   response = sg.client.mail._('send').post(request_body: mail.to_json)
  #   puts response.status_code
  #   puts response.body
  #   puts response.headers
  #   if @task.href === ""
  #     redirect_to "http://help.powerreviews.com"
  #   else
  #     redirect_to "#{@task.href}"
  #   end
  # end
  def send_email
      @task = Task.create(subject: params[:subject],email_to_send: params[:email_to_send],description: params[:description],href: params[:href],reproduce: params[:reproduce])
    # CaseMailer.case_name('nick',@task.email_to_send,@task.description).deliver do
    CaseMailer.case_name(@task).deliver do
      html_part do
        body "#{description}"
      end
    end
#
# ActionMailer::Base.mail(from: "me@example.com", to: "nicholas.block@powerreviews.com", subject: "test", body: "test").deliver
#     mail = Mail.deliver do
#         to      'nicholas.block@powerreviews.com'
#         from    'John Doe <john@doe.com>' # Your from name and email address
#         subject 'A transactional email from Mandrill!'
#
#
#         html_part do
#           headers['X-MC-Subaccount'] = 'support'
#           content_type 'text/html; charset=UTF-8'
#           body '<head>hello</head><body><em>Mandrill speaks <strong>HTML</strong></em></body>'
#         end
#     end
#
#     puts mail
    render html: { status: 'ok' }
  end


  private
  def task_params
    # params.require(:task).permit(:name,:email_to_send,:description)
    params.permit(:name,:email_to_send,:description,:href,:reproduce)
    # params.permit(:name,:email_to_send,:description).to_h
  end
end
