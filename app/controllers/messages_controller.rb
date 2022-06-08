class MessagesController < ApplicationController
  def index
    messages = Message.order('RANDOM()').first
    render json: messages
  end

  def create
    message = Message.create(message_param)
    render json: message
  end

  def update
    message = Message.find(params[:id])
    message.update(message_param)
    render json: message
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    head :no_content, status: :ok
  end

  private

  def message_param
    params.require(:message).permit(:greeting)
  end
end
