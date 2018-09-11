class CaseMailer < ApplicationMailer
    default :from => "powerreviews.com"

    def case_name(task)
    @task = task
    headers['X-MC-Subaccount'] = 'support'

    mail :subject => "#{@task.subject}",
         :to      => "support@powerreviews.com",
         :from    => "#{@task.email_to_send}"
  end
end
