class AttrsController < ApplicationController
  before_action :set_attr, only: %i[ show edit update destroy ]

  # GET /attrs or /attrs.json
  def index
    @attrs = Attr.all
  end

  # GET /attrs/1 or /attrs/1.json
  def show
  end

  # GET /attrs/new
  def new
    @attr = Attr.new
  end

  # GET /attrs/1/edit
  def edit
  end

  # POST /attrs or /attrs.json
  def create
    @attr = Attr.new(attr_params)

    respond_to do |format|
      if @attr.save
        format.html { redirect_to attr_url(@attr), notice: "Attr was successfully created." }
        format.json { render :show, status: :created, location: @attr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attrs/1 or /attrs/1.json
  def update
    respond_to do |format|
      if @attr.update(attr_params)
        format.html { redirect_to attr_url(@attr), notice: "Attr was successfully updated." }
        format.json { render :show, status: :ok, location: @attr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attrs/1 or /attrs/1.json
  def destroy
    @attr.destroy!

    respond_to do |format|
      format.html { redirect_to attrs_url, notice: "Attr was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attr
      @attr = Attr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attr_params
      params.require(:attr).permit(:attr_title)
    end
end
