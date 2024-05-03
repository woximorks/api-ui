class EndpointAssociatedAttrsController < ApplicationController
  before_action :set_endpoint_associated_attr, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /endpoint_associated_attrs or /endpoint_associated_attrs.json
  def index
    @endpoint_associated_attrs = EndpointAssociatedAttr.all
    @endpoints = Endpoint.all
    @attrs = Attr.all
    @users = User.all
  end

  # GET /endpoint_associated_attrs/1 or /endpoint_associated_attrs/1.json
  def show
  end

  # GET /endpoint_associated_attrs/new
  def new
    @endpoint_associated_attr = EndpointAssociatedAttr.new
  end

  # GET /endpoint_associated_attrs/1/edit
  def edit
  end

  # POST /endpoint_associated_attrs or /endpoint_associated_attrs.json
  def create
    @endpoint_associated_attr = EndpointAssociatedAttr.new(endpoint_associated_attr_params)

    respond_to do |format|
      if @endpoint_associated_attr.save
        format.html { redirect_to endpoint_associated_attr_url(@endpoint_associated_attr), notice: "Endpoint associated attr was successfully created." }
        format.json { render :show, status: :created, location: @endpoint_associated_attr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @endpoint_associated_attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /endpoint_associated_attrs/1 or /endpoint_associated_attrs/1.json
  def update
    respond_to do |format|
      if @endpoint_associated_attr.update(endpoint_associated_attr_params)
        format.html { redirect_to endpoint_associated_attr_url(@endpoint_associated_attr), notice: "Endpoint associated attr was successfully updated." }
        format.json { render :show, status: :ok, location: @endpoint_associated_attr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @endpoint_associated_attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /endpoint_associated_attrs/1 or /endpoint_associated_attrs/1.json
  def destroy
    @endpoint_associated_attr.destroy!

    respond_to do |format|
      format.html { redirect_to endpoint_associated_attrs_url, notice: "Endpoint associated attr was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_endpoint_associated_attr
      @endpoint_associated_attr = EndpointAssociatedAttr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def endpoint_associated_attr_params
      params.require(:endpoint_associated_attr).permit(:endpoint_id, :attr_id, :endpoint_create, :endpoint_update, :endpoint_show, :endpoint_index, :endpoint_delete, :attr_create_request, :attr_create_response, :attr_delete_request, :attr_delete_response, :attr_index_request, :attr_index_response, :attr_show_request, :attr_show_response, :attr_update_request, :attr_update_response, :attr_type, :associated_ui_info, :associated_product_info)
    end
end
