class CaseMailer < ApplicationMailer
  # def case_name(name,email,description)
    def case_name(task)
    @task = task
    headers['X-MC-Subaccount'] = 'support'

    mail :subject => "Mandrill rides the Rails!",
         :to      => "nicholas.block@powerreviews.com",
         :from    => "nicholasblock78@gmail.com"
  end
end
