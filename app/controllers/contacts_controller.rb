class ContactsController < ApplicationController

  def new
      @contact = Contact.new
  end

  def create
      @contact = Contact.new(contact_params)
      if @contact.save
          #redirect_to @contact
          flash.now[:notice] = 'Thank you for your message .we will cantact you soon!.'
      else
          flash.now[:error] = 'Cannot send massage'
          render 'new'
      end
  end
   private

    def contact_params
        params.require(:contact).permit(:name, :email, :message, :nickname)  # this is for  strong parameters
    end

end
