class PagesController < ApplicationController
  def home
    @endpoints = Endpoint.all
    @attrs = Attr.all
    @endpoint_associated_attrs = EndpointAssociatedAttr.all
  end
end
