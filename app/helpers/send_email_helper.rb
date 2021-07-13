helpers do
  def send_email(from, subject, email, message)
    Pony.mail to: ENV['TO_EMAIL'],
    from: from,
    subject: subject,
    body: "#{email} wrote:\n#{message}",
    via: :smtp,
    via_options: {
      address: 'smtp.gmail.com',
      port: '587',
      user_name: ENV['GMAIL_USER'],
      password: ENV['GMAIL_PASSWORD'],
      authentication: :plain,
      domain: 'localhost.localdomain'
    }
  end
end
