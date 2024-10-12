class AssociatedAttrsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_associated_attr, only: [:show, :edit, :update, :destroy]
  
    def index
      @associated_attrs = AssociatedAttr.all  # Fetch all associated attributes
    end
  
    def show
    end
  
    def new
      @associated_attr = AssociatedAttr.new  # Initialize a new AssociatedAttr
    end
  
    def create
      @associated_attr = AssociatedAttr.new(associated_attr_params)
      if @associated_attr.save
        redirect_to @associated_attr, notice: 'Associated attribute was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      # @associated_attr is already set by before_action
    end
  
    def update
      if @associated_attr.update(associated_attr_params)
        redirect_to @associated_attr, notice: 'Associated attribute was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @associated_attr.destroy
      redirect_to associated_attrs_url, notice: 'Associated attribute was successfully destroyed.'
    end
  
    private
  
    def set_associated_attr
      @associated_attr = AssociatedAttr.find(params[:id])  # Find the AssociatedAttr by ID
    end
  
    def associated_attr_params
      # Parse JSON strings before saving them
      params.require(:associated_attr).permit(:request_type, :ui_info, :associated_endpoints, :attr_title).tap do |whitelisted|
        whitelisted[:request_type] = JSON.parse(whitelisted[:request_type]) if whitelisted[:request_type].is_a?(String)
        whitelisted[:ui_info] = JSON.parse(whitelisted[:ui_info]) if whitelisted[:ui_info].is_a?(String)
        whitelisted[:associated_endpoints] = JSON.parse(whitelisted[:associated_endpoints]) if whitelisted[:associated_endpoints].is_a?(String)
      end
    end
  end
  