class PagesController < ApplicationController

  def index
      @endpoints = Endpoint.all
      @attrs = Attr.all
      @associated_attrs = AssociatedAttr.all
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
end