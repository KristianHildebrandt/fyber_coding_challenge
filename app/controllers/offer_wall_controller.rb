class OfferWallController < ApplicationController
  OFFERWALL_OPTIONS = {
    format: 'json',
    appid: 157,
    locale: 'de',
    os_version: '7.0',
    timestamp: Time.now.to_i,
    apple_idfa: '2b6f0cc904d137be2e1730235f5664094b83',
    apple_idfa_tracking_enabled: true,
    ip: '109.235.143.113',
    offer_types: 112
  }

  before_filter do
    @form = OfferWall.new(offer_wall_params)
  end

  def list
    if @form.valid?
      @offers = Fyber::Client.offer_wall(api_options)

      render 'list'
    else
      render 'form'
    end
  end

  private

  def api_options
    OFFERWALL_OPTIONS.merge(offer_wall_params)
  end

  def offer_wall_params
    params.require(:offer_wall).permit(:uid, :page, :pub0) if params.has_key?(:offer_wall)
  end
end
