class MessagesController < ApplicationController
    before_action :authenticate_user!, :only => [:create]
    
    def create
        @message = Message.create(params.require(:message).permit(:user_id, :room_id, :content).merge(:user_id => current_user.id))
        redirect_to :back
    end
end
