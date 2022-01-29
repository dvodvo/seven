class ArticlephotosController < ApplicationController
  before_action :set_articlephoto, only: %i[ show edit update destroy ]

  # GET /articlephotos or /articlephotos.json
  def index
#    @articlephotos = Articlephoto.with_attached_photo.page params[:page]
    @articlephotos = Articlephoto.page params[:page]
  end

  # GET /articlephotos/1 or /articlephotos/1.json
  def show
  end

  # GET /articlephotos/new
  def new
    @articlephoto = Articlephoto.new
  end

  # GET /articlephotos/1/edit
  def edit
  end

  def scan
  end

  # POST /articlephotos or /articlephotos.json
  def create
    @articlephoto = Articlephoto.new(articlephoto_params)

    respond_to do |format|
      if @articlephoto.save
        format.html { redirect_to articlephoto_url(@articlephoto), notice: "Articlephoto was successfully created." }
        format.json { render :show, status: :created, location: @articlephoto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @articlephoto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articlephotos/1 or /articlephotos/1.json
  def update
    respond_to do |format|
      if @articlephoto.update(articlephoto_params)
        format.html { redirect_to articlephoto_url(@articlephoto), notice: "Articlephoto was successfully updated." }
        format.json { render :show, status: :ok, location: @articlephoto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @articlephoto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articlephotos/1 or /articlephotos/1.json
  def destroy
    @articlephoto.destroy

    respond_to do |format|
      format.html { redirect_to articlephotos_url, notice: "Articlephoto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articlephoto
      @articlephoto = Articlephoto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def articlephoto_params
      params.require(:articlephoto).permit(:name, :sequence, :photo)
    end
end
