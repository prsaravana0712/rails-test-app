class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  # GET /chats
  def index
    @chats = Chat.all
  end

  # GET /chats/:id
  def show
  end

  # GET /chats/new
  def new
    @chats = Chat.all
    @chat = Chat.new
  end

  # GET /chats/:id/edit
  def edit
  end

  # POST /chats
  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        ActionCable.server.broadcast 'chat_channel', content: @chat
        # format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
        # format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/:id
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/:id
  def destroy
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to chats_url, notice: 'Chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit(:message)
    end
end
