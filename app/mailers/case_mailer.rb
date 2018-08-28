class CaseMailer < ApplicationMailer
    def case_name(task)
    @task = task
    headers['X-MC-Subaccount'] = 'support'

    mail :subject => "#{@task.subject}",
         :to      => "#{@task.email_to_send}",
         :from    => "nicholas.block@powerreviews.com"
  end
end
