class PagesController < ApplicationController
  def home
    @endpoints = Endpoint.all
    @attrs = Attr.all
  end
end
