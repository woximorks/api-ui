class PagesController < ApplicationController

  def index
      @associated_attrs = AssociatedAttr.all
      if params[:keyword].present?
        @results = @associated_attrs.search_by_title(params[:keyword])
      else
        @results = []
      end
  end
  def home
      @associated_attrs = AssociatedAttr.all
  end
  def actionlog
    @associated_attrs = AssociatedAttr.all
  end
  def agent
    @associated_attrs = AssociatedAttr.all
  end
  def brand
    @associated_attrs = AssociatedAttr.all
  end
  def buyertransaction
   @associated_attrs = AssociatedAttr.all
  end
  def company
    @associated_attrs = AssociatedAttr.all
  end

  def contact
    @associated_attrs = AssociatedAttr.all
  end

  def emailcampaign
    @associated_attrs = AssociatedAttr.all
  end

  def event
    @associated_attrs = AssociatedAttr.all
  end

  def gallery
    @associated_attrs = AssociatedAttr.all
  end

  def group
    @associated_attrs = AssociatedAttr.all
  end

  def leadsource
    @associated_attrs = AssociatedAttr.all
  end

  def listing
    @associated_attrs = AssociatedAttr.all
  end

  def office
    @associated_attrs = AssociatedAttr.all
  end

end