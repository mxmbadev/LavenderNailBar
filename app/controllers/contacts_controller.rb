class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_to root_path, notice: "Your Message has been delivered. We will get in touch with you as soon as possible."
    else
      flash.now[:error] = 'Sorry Cannot send message.'
      render :new
    end
  end
end
