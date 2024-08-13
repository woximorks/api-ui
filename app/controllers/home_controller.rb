class HomeController < ApplicationController
    before_action :authenticate_user!, except: [:show]
    def index
        @endpoints = Endpoint.all
        @attrs = Attr.all
        @associated_attrs = AssociatedAttr.all
    end
    def show
        @endpoints = Endpoint.all
        @attrs = Attr.all
    end
end
