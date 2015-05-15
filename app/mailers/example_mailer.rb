class ExampleMailer < ApplicationMailer
     default from: "nunerajender15@gmail.com"
  def sample_email(post)
    @post = post
    mail(to: @post.title, subject: 'Sample Email')
  end

end
