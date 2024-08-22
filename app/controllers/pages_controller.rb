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
end