class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        @endpoints = Endpoint.all
        @attrs = Attr.all
        @associated_attrs = AssociatedAttr.all
    end
end
