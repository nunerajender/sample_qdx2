class ExampleMailer < ApplicationMailer
     default from: "nunerajender0526@gmail.com"
  def sample_email(post)
    @post = post
    mail(to: @post.title, subject: 'Sample Email')
  end

end
