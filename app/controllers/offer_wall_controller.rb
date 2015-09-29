class OfferWallController < ApplicationController
  before_filter do
    @form = OfferWall.new(params[:offer_wall])
  end

  def list
    if @form.valid?
      render 'list'
    else
      render 'form'
    end
  end
end
