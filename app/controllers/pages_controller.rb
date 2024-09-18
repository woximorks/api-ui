class PagesController < ApplicationController

  def index
      @endpoints = Endpoint.all
      @attrs = Attr.all
      @associated_attrs = AssociatedAttr.all
      if params[:keyword].present?
        @results = @associated_attrs.search(params[:keyword])
      else
        @results = []
      end
  end
  def home
      @endpoints = Endpoint.all
      @attrs = Attr.all
      @associated_attrs = AssociatedAttr.all
  end
  def actionlog
      @endpoints = Endpoint.all
      @attrs = Attr.all
      @associated_attrs = AssociatedAttr.all
  end
  def agent
    @endpoints = Endpoint.all
    @attrs = Attr.all
    @associated_attrs = AssociatedAttr.all
  end
  def brand
    @endpoints = Endpoint.all
    @attrs = Attr.all
    @associated_attrs = AssociatedAttr.all
  end
  def buyertransaction
    @endpoints = Endpoint.all
    @attrs = Attr.all
    @associated_attrs = AssociatedAttr.all
  end
  def company
    @endpoints = Endpoint.all
    @attrs = Attr.all
    @associated_attrs = AssociatedAttr.all
  end

  def contact
    @endpoints = Endpoint.all
    @attrs = Attr.all
    @associated_attrs = AssociatedAttr.all
  end

  def emailcampaign
    @endpoints = Endpoint.all
    @attrs = Attr.all
    @associated_attrs = AssociatedAttr.all
  end

end