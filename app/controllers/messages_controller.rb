class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update]
  
  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to root_path , notice: 'Completed edit message'
      
    else
      render 'edit'
    end
  end
  
  def index
    @messages = Message.all
    @message = Message.new
  end


  def create
      @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: "Saved message"
    else
      @messages = Message.all
      flash.now[:alert] = "Sorry, it failed to save the message"
      render 'index'
    end
  end
 
  private
  
  def set_message
    @message = Message.find(params[:id])
  end
  
  def message_params
    params.require(:message).permit(:name, :body)
  end
end


