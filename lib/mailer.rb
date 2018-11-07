require 'pony'

class Mailer

  def self.send(email:, subject:, message:)
    Pony.mail(
      :to => email,
      :from => '"Chitter" <email@chitter.com>',
      :subject => subject,
      :via => :sendmail,
      :via_options => { :location => '/usr/sbin/sendmail', :arguments => '-t' },
      :html_body => message
    )
  end

end