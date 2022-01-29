class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  def sms_pre
    @message = Message.new
  end
  
  def sms_post
    input = params[:message][:content]  # "whateverÇØøÅåΔ^€{}[]~éùìòÇØøÅåΔ^€{}[]~"
    double_character = ['^','€','{','}','[',']','~']
    character_sum = 0
    input.each_char { |c| 
      if double_character.include?(c)
        character_sum += 2
      else
        character_sum += 1
      end
    }
    puts character_sum
    if character_sum < 160
      messages = 1
    elsif (character_sum > 159 && character_sum < 306)
      messages = 2
    else
      multiple_base = character_sum - 306
      messages = 2 + (multiple_base.to_f / 153.to_f).ceil
    end
    puts messages
  end

  # POST /messages or /messages.json
  def create
    message = Message.create!(message_params)

    respond_to do |format|
      if message.save
        format.turbo_stream
        format.html { redirect_to message_url(@message), notice: "Message was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:room_id, :content)
    end
end
