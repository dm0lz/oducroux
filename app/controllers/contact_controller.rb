# encoding: UTF-8
class ContactController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      ContactMailer.send_mail(@message).deliver
      redirect_to(root_path, :notice => "Merci. Votre message a bien été envoyé.")
    else
      flash.now.alert = "Veuillez remplir tous les champs."
      render :new
    end
  end
end
