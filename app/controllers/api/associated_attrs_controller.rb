module Api
    class AssociatedAttrsController < ApplicationController
      def show
        attr_title = params[:attr_title]
        record = AssociatedAttr.find_by(attr_title: attr_title)
  
        if record
          render json: record
        else
          render json: { error: 'Data not found' }, status: :not_found
        end
      end
    end
  end