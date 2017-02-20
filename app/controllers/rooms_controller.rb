class RoomsController < ApplicationController
     before_action :authenticate_user!, :only => [:create, :show, :index, :edit, :update]
     
     def create
         @room = Room.create
         @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id )
         @ent2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
         redirect_to "/rooms/#{@room.id}"
         flash[:notice] = "チャットを作成しました"
     end

    def show
        @room = Room.find(params[:id])
        @messages = @room.messages
        @message = Message.new
        @entries = @room.entries
    end
    
    def index
        @entries = current_user.entries
    end
    
    def edit
        @room = Room.find(params[:id])
    end
    
    def update
    end
end
