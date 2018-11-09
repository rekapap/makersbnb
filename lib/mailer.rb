require 'pony'

class Mailer
  def self.send(email:, subject:, message:)
    Pony.mail(
      :to => email,
      :from => '"MakersBNB" <email@makersbnb.com>',
      :subject => subject,
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'toddpla.makers@gmail.com',
        :password             => 'makers123',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      },
      :html_body => message
    )
  end
end
